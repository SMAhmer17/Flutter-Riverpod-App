import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/constants/prefs_keys.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';
import 'package:flutter_riverpod_template/core/providers/theme_notifier_provider.dart';

/// Notifier to manage and persist app locale changes.
class LanguageNotifier extends Notifier<AppLocale> {
  @override
  AppLocale build() {
    // Return the current locale.
    // LocaleSettings.instance is already updated in main.dart before runApp.
    return LocaleSettings.currentLocale;
  }

  /// Updates the app language and persists the choice to SharedPreferences.
  Future<void> setLanguage(AppLocale locale) async {
    final prefs = ref.read(sharedPreferencesProvider);

    // 1. Persist the language code
    await prefs.setString(PrefsKeys.selectedLocale, locale.languageCode);

    // 2. Update the slang global state
    LocaleSettings.setLocale(locale);

    // 3. Update the Riverpod state (notifies listeners)
    state = locale;
  }
}

/// Provider for the [LanguageNotifier].
final languageNotifierProvider = NotifierProvider<LanguageNotifier, AppLocale>(
  () => LanguageNotifier(),
);
