import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter_riverpod_template/core/utils/app_logger.dart';

class StartupService {
  StartupService._();

  static Future<void> logDeviceInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final deviceInfo = DeviceInfoPlugin();

      AppLogger.info('——————— APP STARTUP INFO ———————');
      AppLogger.info('App Name: ${packageInfo.appName}');
      AppLogger.info(
        'Version: ${packageInfo.version}+${packageInfo.buildNumber}',
      );
      AppLogger.info('Package: ${packageInfo.packageName}');

      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        AppLogger.info('Platform: Android');
        AppLogger.info(
          'OS Version: ${androidInfo.version.release} (SDK ${androidInfo.version.sdkInt})',
        );
        AppLogger.info(
          'Device: ${androidInfo.manufacturer} ${androidInfo.model}',
        );
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
