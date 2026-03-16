import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/constants/prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// SharedPreferences provider.
/// Must be overridden in main.dart via ProviderScope(overrides: [...]).
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError(
    'SharedPreferences must be initialized before runApp().\n'
    'Pass it via ProviderScope(overrides: [sharedPreferencesProvider.overrideWithValue(prefs)]).',
  );
});

class ThemeNotifierProvider extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    // Restore the user's saved theme preference on every app launch.
    final prefs = ref.read(sharedPreferencesProvider);
    final savedIndex = prefs.getInt(PrefsKeys.themeMode);
    if (savedIndex == null ||
        savedIndex < 0 ||
        savedIndex >= ThemeMode.values.length) {
      return ThemeMode.system;
    }
    return ThemeMode.values[savedIndex];
  }

  /// Toggles between [ThemeMode.light] and [ThemeMode.dark].
  /// Call [setThemeMode] directly to set a specific mode (including system).
  void toggleTheme() {
    setThemeMode(state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setInt(PrefsKeys.themeMode, mode.index);
    state = mode;
  }
}

final themeNotifierProvider =
    NotifierProvider<ThemeNotifierProvider, ThemeMode>(
      () => ThemeNotifierProvider(),
    );
