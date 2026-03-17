import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod_template/core/constants/prefs_keys.dart';
import 'package:flutter_riverpod_template/core/service/local_store/hive_store.dart';
import 'package:flutter_riverpod_template/core/utils/app_logger.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartupService {
  StartupService._();

  /// Initializes all services required before [runApp].
  /// Returns [prefs] and [packageInfo] for ProviderScope overrides.
  static Future<({SharedPreferences prefs, PackageInfo packageInfo})>
      initialize() async {
    await Firebase.initializeApp();
    await HiveStore.init();

    final prefs = await SharedPreferences.getInstance();
    final packageInfo = await PackageInfo.fromPlatform();

    _restoreLocale(prefs);
    await _logDeviceInfo(packageInfo);

    return (prefs: prefs, packageInfo: packageInfo);
  }

  // ————————————————— Private —————————————————

  static void _restoreLocale(SharedPreferences prefs) {
    final savedLocale = prefs.getString(PrefsKeys.selectedLocale);
    if (savedLocale != null) {
      AppLogger.info('Restoring saved locale: $savedLocale');
      LocaleSettings.setLocaleRawSync(savedLocale);
    } else {
      AppLogger.info('No saved locale found, detecting device locale...');
      LocaleSettings.useDeviceLocaleSync();
    }
  }

  static Future<void> _logDeviceInfo(PackageInfo packageInfo) async {
    try {
      final deviceInfo = DeviceInfoPlugin();

      AppLogger.info('——————— APP STARTUP INFO ———————');
      AppLogger.info('App Name: ${packageInfo.appName}');
      AppLogger.info('Version: ${packageInfo.version}+${packageInfo.buildNumber}');
      AppLogger.info('Package: ${packageInfo.packageName}');

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        AppLogger.info('Platform: Android');
        AppLogger.info('OS Version: ${androidInfo.version.release} (SDK ${androidInfo.version.sdkInt})');
        AppLogger.info('Device: ${androidInfo.manufacturer} ${androidInfo.model}');
      } else if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        AppLogger.info('Platform: iOS');
        AppLogger.info('OS Version: ${iosInfo.systemVersion}');
        AppLogger.info('Device: ${iosInfo.name} (${iosInfo.model})');
      } else if (Platform.isMacOS) {
        final macInfo = await deviceInfo.macOsInfo;
        AppLogger.info('Platform: macOS');
        AppLogger.info('Kernel Version: ${macInfo.kernelVersion}');
        AppLogger.info('Model: ${macInfo.model}');
      } else {
        AppLogger.info('Platform: ${Platform.operatingSystem}');
      }

      AppLogger.info('——————————————————————————');
    } catch (e, stack) {
      AppLogger.error('Failed to log device info', e, stack);
    }
  }
}
