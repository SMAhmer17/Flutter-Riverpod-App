// ————————————————— Dependencies —————————————————

import 'package:dio/dio.dart';

import 'dio_config.dart';
import 'dio_interceptors.dart';

// ————————————————— Dio Service —————————————————

/// Reusable Dio client. Inject via constructor.
///
/// Basic setup:
/// ```dart
/// final service = DioService(
///   config: DioConfig(baseUrl: 'https://api.example.com'),
///   interceptors: [LoggingInterceptor()],
/// );
/// ```
///
/// With auth + auto token-refresh:
/// ```dart
/// final service = DioService.withAuth(
///   config: DioConfig(baseUrl: 'https://api.example.com'),
///   initialToken: accessToken,
///   onRefreshToken: () async => await refreshAccessToken(),
/// );
/// ```
class DioService {
  // ————————————————— Fields —————————————————

  final Dio _dio;

  // ————————————————— Constructor —————————————————

  DioService({
    required DioConfig config,
    List<Interceptor>? interceptors,
    Dio? dio,
  }) : _dio = _buildDio(config, dio) {
    if (interceptors != null) {
      for (final interceptor in interceptors) {
        // Give AuthInterceptor a reference to this Dio instance for retries.
        if (interceptor is AuthInterceptor) interceptor.attachDio(_dio);
        _dio.interceptors.add(interceptor);
      }
    }
  }

  // ————————————————— Named Factory — Auth —————————————————

  /// Pre-configured service with [LoggingInterceptor] + [AuthInterceptor].
  /// The [AuthInterceptor] handles 401s, queues concurrent requests, and
  /// retries them once a new token is obtained via [onRefreshToken].
  factory DioService.withAuth({
    required DioConfig config,
    required Future<String?> Function() onRefreshToken,
    String? initialToken,
  }) {
    final auth = AuthInterceptor(
      token: initialToken,
      onRefreshToken: onRefreshToken,
    );
    return DioService(
      config: config,
      interceptors: [LoggingInterceptor(), auth],
    );
  }

  // ————————————————— Requests —————————————————

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.get(
        path,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> post(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.post(
        path,
        data: body,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> put(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.put(
        path,
        data: body,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.patch(
        path,
        data: body,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final res = await _dio.delete(
        path,
        data: body,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  // ————————————————— Multipart Upload —————————————————

  /// Uploads [files] as multipart. Use [fileField] for the file key.
  Future<dynamic> upload(
    String path, {
    required List<MultipartFile> files,
    String fileField = 'file',
    Map<String, dynamic>? fields,
    Options? options,
    CancelToken? cancelToken,
    void Function(int sent, int total)? onSendProgress,
  }) async {
    try {
      final formData = FormData.fromMap({
        ...?fields,
        fileField: files.length == 1 ? files.first : files,
      });
      final res = await _dio.post(
        path,
        data: formData,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
      );
      return res.data;
    } on DioException {
      rethrow;
    }
  }

  // ————————————————— Download —————————————————

  /// Downloads a file from [url] and saves it to [savePath].
  ///
  /// ```dart
  /// await service.download(
  ///   '/report.pdf',
  ///   savePath: '/storage/report.pdf',
  ///   onReceiveProgress: (received, total) => print('$received / $total'),
  /// );
  /// ```
  Future<void> download(
    String url, {
    required String savePath,
    Map<String, dynamic>? queryParams,
    Options? options,
    CancelToken? cancelToken,
    void Function(int received, int total)? onReceiveProgress,
  }) async {
    try {
      await _dio.download(
        url,
        savePath,
        queryParameters: queryParams,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
    } on DioException {
      rethrow;
    }
  }

  // ————————————————— Runtime Config —————————————————

  void addInterceptor(Interceptor interceptor) {
    if (interceptor is AuthInterceptor) interceptor.attachDio(_dio);
    _dio.interceptors.add(interceptor);
  }

  void setAuthToken(String token) =>
      _dio.options.headers['Authorization'] = 'Bearer $token';

  void clearAuthToken() => _dio.options.headers.remove('Authorization');

  // ————————————————— Raw Client —————————————————

  Dio get client => _dio;

  // ————————————————— Private Helpers —————————————————

  static Dio _buildDio(DioConfig config, Dio? override) {
    return override ??
        Dio(
          BaseOptions(
            baseUrl: config.baseUrl,
            connectTimeout: config.connectTimeout,
            receiveTimeout: config.receiveTimeout,
            sendTimeout: config.sendTimeout,
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
              ...?config.defaultHeaders,
            },
          ),
        );
  }
}
