

import 'package:hive_flutter/hive_flutter.dart';


/// Wrapper around a Hive [Box]. Each instance manages one named box.
/// Use [HiveStore.open] to initialise, or inject an already-open box.
///
/// Initialise Hive once at app start (e.g. in [StartupService]):
/// ```dart
/// await HiveStore.init();
/// ```
///
/// Then open per-feature stores:
/// ```dart
/// final cartStore = await HiveStore.open('cart');
/// final settingsStore = await HiveStore.open('settings');
/// ```
class HiveStore {
  final Box _box;
  HiveStore(this._box);

  // ————————————————— Init —————————————————

  /// Call once at app startup before any [HiveStore.open] calls.
  /// Place in [StartupService.initialize].
  static Future<void> init({String? subDirectory}) =>
      Hive.initFlutter(subDirectory);

  /// Opens the box named [boxName] and returns a [HiveStore] for it.
  /// Safe to call multiple times — Hive returns the cached box if already open.
  static Future<HiveStore> open<T>(String boxName) async {
    final box = await Hive.openBox<T>(boxName);
    return HiveStore(box);
  }

  /// Opens a lazy box — values are loaded from disk on demand.
  static Future<LazyHiveStore> openLazy<T>(String boxName) async {
    final box = await Hive.openLazyBox<T>(boxName);
    return LazyHiveStore(box);
  }

  // ————————————————— Read —————————————————

  T? get<T>(String key, {T? defaultValue}) =>
      _box.get(key, defaultValue: defaultValue) as T?;

  T? getAt<T>(int index) => _box.getAt(index) as T?;

  bool containsKey(String key) => _box.containsKey(key);

  List<dynamic> get values => _box.values.toList();

  List<String> get keys => _box.keys.cast<String>().toList();

  int get length => _box.length;

  bool get isEmpty => _box.isEmpty;

  // ————————————————— Write —————————————————

  Future<void> put(String key, dynamic value) => _box.put(key, value);

  Future<void> putAll(Map<String, dynamic> entries) => _box.putAll(entries);

  Future<void> add(dynamic value) => _box.add(value);

  Future<void> addAll(List<dynamic> values) => _box.addAll(values);

  // ————————————————— Delete —————————————————

  Future<void> delete(String key) => _box.delete(key);

  Future<void> deleteAll(List<String> keys) => _box.deleteAll(keys);

  Future<void> clear() => _box.clear();

  // ————————————————— Lifecycle —————————————————

  /// Closes the box. After this, the store must not be used.
  Future<void> close() => _box.close();

  /// Deletes the box file from disk entirely.
  Future<void> deleteFromDisk() => _box.deleteFromDisk();

  /// Stream of [BoxEvent]s — react to any change in this box.
  Stream<BoxEvent> watch({String? key}) => _box.watch(key: key);

  // ————————————————— Raw Box —————————————————

  Box get box => _box;
}

// ————————————————— Lazy Hive Store —————————————————

/// Same as [HiveStore] but backed by a [LazyBox] — values are read from
/// disk only when accessed. Prefer this for large datasets.
class LazyHiveStore {
  // ————————————————— Fields —————————————————

  final LazyBox _box;

  // ————————————————— Constructor —————————————————

  LazyHiveStore(this._box);

  // ————————————————— Read —————————————————

  Future<T?> get<T>(String key) async => (await _box.get(key)) as T?;

  Future<T?> getAt<T>(int index) async => (await _box.getAt(index)) as T?;

  bool containsKey(String key) => _box.containsKey(key);

  List<String> get keys => _box.keys.cast<String>().toList();

  int get length => _box.length;

  // ————————————————— Write —————————————————

  Future<void> put(String key, dynamic value) => _box.put(key, value);

  Future<void> putAll(Map<String, dynamic> entries) => _box.putAll(entries);

  // ————————————————— Delete —————————————————

  Future<void> delete(String key) => _box.delete(key);

  Future<void> clear() => _box.clear();

  // ————————————————— Lifecycle —————————————————

  Future<void> close() => _box.close();

  Future<void> deleteFromDisk() => _box.deleteFromDisk();

  Stream<BoxEvent> watch({String? key}) => _box.watch(key: key);
}
