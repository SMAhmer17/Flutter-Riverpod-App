// ————————————————— Dependencies —————————————————

import 'package:dio/dio.dart';
import 'package:flutter_riverpod_template/core/utils/app_logger.dart';

// ————————————————— Logging Interceptor —————————————————

/// Logs every request/response via [AppLogger]. Debug-mode only.
class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.info('[${options.method}] ${options.uri}');
    if (options.data != null) AppLogger.debug('Body: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.success('[${response.statusCode}] ${response.requestOptions.uri}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.error(
      '[${err.response?.statusCode}] ${err.requestOptions.uri}',
      err,
      err.stackTrace,
    );
    handler.next(err);
  }
}

// ————————————————— Auth Interceptor —————————————————

/// Injects a Bearer token into every request.
///
/// On a 401:
/// - Calls [onRefreshToken] once (guarded against concurrent calls).
/// - Retries the original request and any requests that arrived while
///   the refresh was in-flight.
/// - If refresh returns null, all queued requests are forwarded as errors.
///
/// Must be attached to a Dio instance via [attachDio] before use,
/// or constructed through [DioService.withAuth].
class AuthInterceptor extends Interceptor {
  // ————————————————— Fields —————————————————

  /// The Dio instance this interceptor retries against.
  /// Set via [attachDio] after the Dio client is created.
  Dio? _dio;

  String? _token;
  final Future<String?> Function()? onRefreshToken;

  bool _isRefreshing = false;
  final List<({RequestOptions options, ErrorInterceptorHandler handler})>
      _queue = [];

  // ————————————————— Constructor —————————————————

  AuthInterceptor({String? token, this.onRefreshToken}) : _token = token;

  // ————————————————— Setup —————————————————

  /// Called by [DioService] after the Dio instance is ready.
  // ignore: use_setters_to_change_properties
  void attachDio(Dio dio) => _dio = dio;

  // ————————————————— Token Management —————————————————

  void setToken(String token) => _token = token;
  void clearToken() => _token = null;

  // ————————————————— Interceptor Hooks —————————————————

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) options.headers['Authorization'] = 'Bearer $_token';
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401 || onRefreshToken == null || _dio == null) {
      return handler.next(err);
    }

    // ————————————————— Race-condition guard —————————————————

    if (_isRefreshing) {
      // Park this request; it will be resolved once refresh completes.
      _queue.add((options: err.requestOptions, handler: handler));
      return;
    }

    _isRefreshing = true;

    try {
      final newToken = await onRefreshToken!();

      if (newToken == null) {
        // Refresh failed — reject everything in the queue.
        for (final pending in _queue) {
          pending.handler.next(err);
        }
        return handler.next(err);
      }

      _token = newToken;
      _dio!.options.headers['Authorization'] = 'Bearer $newToken';

      // Retry original request.
      final retried = await _retry(err.requestOptions, newToken);
      handler.resolve(retried);

      // Retry all queued requests.
      for (final pending in _queue) {
        try {
          final res = await _retry(pending.options, newToken);
          pending.handler.resolve(res);
        } on DioException catch (e) {
          pending.handler.next(e);
        }
      }
    } on DioException catch (e) {
      for (final pending in _queue) {
        pending.handler.next(e);
      }
      handler.next(e);
    } finally {
      _isRefreshing = false;
      _queue.clear();
    }
  }

  // ————————————————— Private Helpers —————————————————

  Future<Response<dynamic>> _retry(RequestOptions opts, String token) {
    opts.headers['Authorization'] = 'Bearer $token';
    return _dio!.fetch(opts);
  }
}
