
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


/// Wrapper around [FlutterSecureStorage] for sensitive key-value data
/// (tokens, credentials, PINs). Inject via constructor.
///
/// ```dart
/// final store = SecureStore();
/// await store.write('access_token', token);
/// final token = await store.read('access_token');
/// ```
class SecureStore {
  final FlutterSecureStorage _storage;
  SecureStore({FlutterSecureStorage? storage})
      : _storage = storage ??
            const FlutterSecureStorage(
              aOptions: AndroidOptions(encryptedSharedPreferences: true),
              iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
            );

  // ————————————————— Read —————————————————

  Future<String?> read(String key) => _storage.read(key: key);

  Future<Map<String, String>> readAll() => _storage.readAll();

  Future<bool> containsKey(String key) => _storage.containsKey(key: key);

  // ————————————————— Write —————————————————

  Future<void> write(String key, String value) =>
      _storage.write(key: key, value: value);

  Future<void> writeAll(Map<String, String> values) async {
    for (final entry in values.entries) {
      await _storage.write(key: entry.key, value: entry.value);
    }
  }

  // ————————————————— Delete —————————————————

  Future<void> delete(String key) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();
}
