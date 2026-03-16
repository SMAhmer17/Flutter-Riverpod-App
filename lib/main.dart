import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/constants/prefs_keys.dart';
import 'package:flutter_riverpod_template/core/providers/package_info_provider.dart';
import 'package:flutter_riverpod_template/core/providers/theme_notifier_provider.dart';
import 'package:flutter_riverpod_template/core/service/startup_service.dart';
import 'package:flutter_riverpod_template/core/utils/app_logger.dart';
import 'package:flutter_riverpod_template/flutter_riverpod_template.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize services
  final prefs = await SharedPreferences.getInstance();
  final packageInfo = await PackageInfo.fromPlatform();

  // Restore saved locale or fallback to device locale
  final savedLocale = prefs.getString(PrefsKeys.selectedLocale);
  if (savedLocale != null) {
    AppLogger.info('Restoring saved locale: $savedLocale');
    LocaleSettings.setLocaleRawSync(savedLocale);
  } else {
    AppLogger.info('No saved locale found, detecting device locale...');
    LocaleSettings.useDeviceLocaleSync();
  }

  await StartupService.logDeviceInfo();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(prefs),
        packageInfoProvider.overrideWithValue(packageInfo),
      ],
      child: TranslationProvider(child: const FlutterRiverpodApp()),
    ),
  );
}
