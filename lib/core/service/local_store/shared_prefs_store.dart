
import 'package:shared_preferences/shared_preferences.dart';


/// Wrapper around [SharedPreferences]. Inject via constructor.
///
/// ```dart
/// final store = SharedPrefsStore(prefs: sharedPreferences);
/// await store.setString('token', 'abc');
/// final token = store.getString('token');
/// ```
class SharedPrefsStore {
  final SharedPreferences _prefs;


  const SharedPrefsStore({required SharedPreferences prefs}) : _prefs = prefs;

  // ————————————————— Read —————————————————

  String? getString(String key) => _prefs.getString(key);

  int? getInt(String key) => _prefs.getInt(key);

  double? getDouble(String key) => _prefs.getDouble(key);

  bool? getBool(String key) => _prefs.getBool(key);

  List<String>? getStringList(String key) => _prefs.getStringList(key);

  bool containsKey(String key) => _prefs.containsKey(key);

  Set<String> get keys => _prefs.getKeys();

  // ————————————————— Write —————————————————

  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);

  Future<void> setInt(String key, int value) => _prefs.setInt(key, value);

  Future<void> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);

  Future<void> setBool(String key, bool value) => _prefs.setBool(key, value);

  Future<void> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);

  // ————————————————— Delete —————————————————

  Future<void> remove(String key) => _prefs.remove(key);

  Future<void> clear() => _prefs.clear();
}
