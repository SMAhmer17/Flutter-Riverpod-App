import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/constants/icons/app_icons.dart';
import 'package:flutter_riverpod_template/core/constants/icons/dark_theme_icons.dart';
import 'package:flutter_riverpod_template/core/constants/icons/light_theme_icons.dart';
import 'package:flutter_riverpod_template/core/constants/images/app_images.dart';
import 'package:flutter_riverpod_template/core/constants/images/dark_theme_images.dart';
import 'package:flutter_riverpod_template/core/constants/images/light_theme_assets.dart';
import 'package:flutter_riverpod_template/core/providers/theme_notifier_provider.dart';

/// Derives [isDark] from the current [ThemeMode], including the system case.
/// All asset providers share this single source of truth.
final _isDarkProvider = Provider<bool>((ref) {
  final mode = ref.watch(themeNotifierProvider);
  if (mode == ThemeMode.system) {
    return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
        Brightness.dark;
  }
  return mode == ThemeMode.dark;
});

final appIconsProvider = Provider<AppIcons>((ref) {
  return ref.watch(_isDarkProvider) ? DarkThemeIcons() : LightThemeIcons();
});

final appImagesProvider = Provider<AppImages>((ref) {
  return ref.watch(_isDarkProvider) ? DarkThemeImages() : LightThemeImages();
});
