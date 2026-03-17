
import 'package:cloud_functions/cloud_functions.dart';


class CloudFunctionService {

  final FirebaseFunctions _functions;

  CloudFunctionService({
    required FirebaseFunctions functions,
  }) : _functions = functions;

  // ————————————————— Core Call —————————————————

  /// Calls the callable Cloud Function named [name] with optional [data].
  /// Returns the response data cast to [T].
  /// Throws [FirebaseFunctionsException] on failure.
  Future<T> call<T>({
    required String name,
    Map<String, dynamic>? data,
    String? region,
  }) async {
    try {
      final HttpsCallable callable = region != null
          ? FirebaseFunctions.instanceFor(region: region).httpsCallable(name)
          : _functions.httpsCallable(name);

      final HttpsCallableResult result = await callable.call(data);

      return result.data as T;
    } on FirebaseFunctionsException {
      rethrow;
    }
  }

  // ————————————————— Typed Helpers —————————————————

  /// Calls [name] and returns the response as [Map<String, dynamic>].
  Future<Map<String, dynamic>> callMap({
    required String name,
    Map<String, dynamic>? data,
    String? region,
  }) async {
    final result = await call<Map<Object?, Object?>>(
      name: name,
      data: data,
      region: region,
    );
    return result.map((k, v) => MapEntry(k.toString(), v));
  }

  /// Calls [name] and returns the response as [List<dynamic>].
  Future<List<dynamic>> callList({
    required String name,
    Map<String, dynamic>? data,
    String? region,
  }) async {
    return await call<List<dynamic>>(
      name: name,
      data: data,
      region: region,
    );
  }


  /// Calls [name] expecting no meaningful return value (fire-and-forget style).
  Future<void> callVoid({
    required String name,
    Map<String, dynamic>? data,
    String? region,
  }) async {
    await call<dynamic>(name: name, data: data, region: region);
  }


  // ————————————————— Callable Builder —————————————————

  /// Returns a raw [HttpsCallable] reference for advanced use cases
  /// (e.g. streaming, custom timeout, or chaining).
  HttpsCallable callable(
    String name, {
    String? region,
    HttpsCallableOptions? options,
  }) {
    final FirebaseFunctions instance =
        region != null ? FirebaseFunctions.instanceFor(region: region) : _functions;

    return options != null
        ? instance.httpsCallable(name, options: options)
        : instance.httpsCallable(name);
  }
}
