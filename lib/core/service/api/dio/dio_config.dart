// ————————————————— Dio Config —————————————————

/// Configuration for [DioService]. Pass to the constructor.
class DioConfig {
  // ————————————————— Fields —————————————————

  final String baseUrl;
  final Duration connectTimeout;
  final Duration receiveTimeout;
  final Duration sendTimeout;
  final Map<String, dynamic>? defaultHeaders;

  // ————————————————— Constructor —————————————————

  const DioConfig({
    required this.baseUrl,
    this.connectTimeout = const Duration(seconds: 15),
    this.receiveTimeout = const Duration(seconds: 15),
    this.sendTimeout = const Duration(seconds: 15),
    this.defaultHeaders,
  });
}
