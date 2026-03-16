import 'dart:developer' as dev;
import 'package:flutter/foundation.dart';

class AppLogger {
  // ANSI Color codes for prettier console output
  static const String _reset = '\x1B[0m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _cyan = '\x1B[36m';

  static void info(String message) {
    if (kDebugMode) {
      dev.log('$_blue ℹ️ INFO: $message$_reset', name: 'APP');
    }
  }

  static void success(String message) {
    if (kDebugMode) {
      dev.log('$_green ✅ SUCCESS: $message$_reset', name: 'APP');
    }
  }

  static void warning(String message) {
    if (kDebugMode) {
      dev.log('$_yellow ⚠️ WARNING: $message$_reset', name: 'APP');
    }
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      dev.log(
        '$_red ❌ ERROR: $message$_reset',
        name: 'APP',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static void debug(String message) {
    if (kDebugMode) {
      dev.log('$_cyan 🐛 DEBUG: $message$_reset', name: 'APP');
    }
  }

  static void log(String message) => info(message);
}
