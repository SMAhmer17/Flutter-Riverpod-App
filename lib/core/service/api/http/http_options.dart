
class HttpOptions {
  final String baseUrl;
  final Duration timeout;
  final Map<String, String>? defaultHeaders;

  const HttpOptions({
    required this.baseUrl,
    this.timeout = const Duration(seconds: 15),
    this.defaultHeaders,
  });
}
