
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_exception.dart';
import 'http_options.dart';

class HttpService {

  final http.Client _client;
  final HttpOptions _options;
  late final Map<String, String> _baseHeaders;

  HttpService({
    required HttpOptions options,
    http.Client? client,
  })  : _client = client ?? http.Client(),
        _options = options {
    _baseHeaders = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      ...?options.defaultHeaders,
    };
  }

  // —————————————————————————————————— Requests ——————————————————————————————————



   // ————————————————— GET —————————————————
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final res = await _client
        .get(_uri(path, queryParams), headers: _headers(headers))
        .timeout(_options.timeout);
    return _parse(res);
  }


  // ————————————————— POST —————————————————
  Future<dynamic> post(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final res = await _client
        .post(_uri(path, null), headers: _headers(headers), body: jsonEncode(body))
        .timeout(_options.timeout);
    return _parse(res);
  }


  // ————————————————— PUT —————————————————
  Future<dynamic> put(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final res = await _client
        .put(_uri(path, null), headers: _headers(headers), body: jsonEncode(body))
        .timeout(_options.timeout);
    return _parse(res);
  }


  // ————————————————— PATCH —————————————————
  Future<dynamic> patch(
    String path, {
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    final res = await _client
        .patch(_uri(path, null), headers: _headers(headers), body: jsonEncode(body))
        .timeout(_options.timeout);
    return _parse(res);
  }


  // ————————————————— DELETE —————————————————
  Future<dynamic> delete(
    String path, {
    Map<String, dynamic>? queryParams,
    Map<String, String>? headers,
  }) async {
    final res = await _client
        .delete(_uri(path, queryParams), headers: _headers(headers))
        .timeout(_options.timeout);
    return _parse(res);
  }

  // —————————————————————————————————— Multipart Upload ——————————————————————————————————

  /// Uploads [files] as a multipart POST to [path].
  ///
  /// ```dart
  /// await service.upload(
  ///   '/avatar',
  ///   files: [await http.MultipartFile.fromPath('file', filePath)],
  ///   fields: {'userId': '123'},
  /// );
  /// ```
  Future<dynamic> upload(
    String path, {
    required List<http.MultipartFile> files,
    Map<String, String>? fields,
    Map<String, String>? headers,
  }) async {
    final request = http.MultipartRequest('POST', _uri(path, null))
      ..headers.addAll(_multipartHeaders(headers))
      ..files.addAll(files)
      ..fields.addAll(fields ?? {});

    final streamed = await _client.send(request).timeout(_options.timeout);
    final res = await http.Response.fromStream(streamed);
    return _parse(res);
  }

  // ————————————————— Runtime Config —————————————————

  void setAuthToken(String token) => _baseHeaders['Authorization'] = 'Bearer $token';

  void clearAuthToken() => _baseHeaders.remove('Authorization');

  // ————————————————— Dispose —————————————————

  void dispose() => _client.close();

  // ————————————————— Private Helpers —————————————————

  Uri _uri(String path, Map<String, dynamic>? queryParams) {
    final base = Uri.parse('${_options.baseUrl}$path');
    if (queryParams == null || queryParams.isEmpty) return base;
    return base.replace(
      queryParameters: queryParams.map((k, v) => MapEntry(k, v.toString())),
    );
  }

  Map<String, String> _headers(Map<String, String>? extra) => {
        ..._baseHeaders,
        ...?extra,
      };

  // Multipart requests must NOT have Content-Type set manually (boundary is auto-added).
  Map<String, String> _multipartHeaders(Map<String, String>? extra) => {
        ...Map.from(_baseHeaders)..remove('Content-Type'),
        ...?extra,
      };

  dynamic _parse(http.Response res) {
    final body = res.body.isEmpty ? null : jsonDecode(res.body);
    if (res.statusCode >= 200 && res.statusCode < 300) return body;
    throw HttpServiceException(
      statusCode: res.statusCode,
      message: body?['message'] as String? ?? res.reasonPhrase ?? 'Unknown error',
      data: body,
    );
  }
}
