// ————————————————— Dependencies —————————————————

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

// ————————————————— App Exception —————————————————

/// Sealed exception union for the entire app.
///
/// Catch low-level exceptions (FirebaseAuthException, DioException, etc.)
/// in your data sources and map them to one of these variants before
/// surfacing them to the UI layer.
///
/// ```dart
/// // In a repository:
/// on FirebaseAuthException catch (e) {
///   throw AppException.firebase(code: e.code, message: e.message ?? '');
/// }
///
/// // In the UI / Notifier:
/// on AppException catch (e) {
///   final msg = e.when(
///     network:     (msg, code) => 'Network error $code: $msg',
///     firebase:    (code, msg) => 'Auth error [$code]: $msg',
///     noInternet:  ()         => 'No internet connection.',
///     server:      (msg, code) => 'Server error $code: $msg',
///     unknown:     (msg, _)   => msg,
///   );
/// }
/// ```
@freezed
sealed class AppException with _$AppException implements Exception {
  // ————————————————— Variants —————————————————

  /// HTTP / Dio request failed (non-2xx response).
  const factory AppException.network({
    required String message,
    int? statusCode,
  }) = NetworkException;

  /// FirebaseException or FirebaseAuthException.
  const factory AppException.firebase({
    required String code,
    required String message,
  }) = FirebaseAppException;

  /// Device has no active network interface.
  const factory AppException.noInternet() = NoInternetAppException;

  /// Server returned 5xx or an unexpected payload.
  const factory AppException.server({
    required String message,
    int? statusCode,
  }) = ServerException;

  /// Catch-all for unhandled errors.
  const factory AppException.unknown({
    required String message,
    Object? error,
  }) = UnknownException;
}
