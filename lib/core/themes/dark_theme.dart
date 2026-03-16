import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/constants/colors/dark_theme_colors.dart';
import 'package:flutter_riverpod_template/core/themes/app_typography.dart';
import 'package:flutter_riverpod_template/core/utils/utils.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: DarkThemeColors.primary,
        brightness: Brightness.dark,
        primary: DarkThemeColors.primary,
      ).copyWith(
        primaryContainer: DarkThemeColors.primaryLight,
        onPrimaryContainer: Colors.black,
        secondary: DarkThemeColors.primaryLight,
        secondaryContainer: DarkThemeColors.primaryLight,
        onSecondaryContainer: Colors.black,
        error: DarkThemeColors.error,
        onError: Colors.black,
        surface: DarkThemeColors.surface,
        onSurface: DarkThemeColors.textPrimary,
      ),
  scaffoldBackgroundColor: DarkThemeColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: DarkThemeColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: DarkThemeColors.accent,
    foregroundColor: Colors.white,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: DarkThemeColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: DarkThemeColors.primary),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: DarkThemeColors.primary,
      side: const BorderSide(color: DarkThemeColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  cardTheme: const CardThemeData(
    color: DarkThemeColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    hintStyle: const TextStyle(color: DarkThemeColors.hintText, fontSize: 14),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: Colors.white.withValues(alpha: 0.1),
        width: 1,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: DarkThemeColors.primary, width: 1.5),
    ),
    prefixIconColor: DarkThemeColors.textSecondary,
    suffixIconColor: DarkThemeColors.textSecondary,
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color(0xFF2E2E2E),
    labelStyle: TextStyle(color: DarkThemeColors.textPrimary),
    secondaryLabelStyle: TextStyle(color: Colors.black),
    selectedColor: DarkThemeColors.primary,
    secondarySelectedColor: DarkThemeColors.primaryLight,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  iconTheme: const IconThemeData(color: DarkThemeColors.textPrimary),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: DarkThemeColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: DarkThemeColors.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: DarkThemeColors.textPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: DarkThemeColors.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: DarkThemeColors.textPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: DarkThemeColors.textPrimary,
    ),
    bodyLarge: TextStyle(fontSize: 14, color: DarkThemeColors.textPrimary),
    bodyMedium: TextStyle(fontSize: 12, color: DarkThemeColors.textSecondary),
    bodySmall: TextStyle(fontSize: 14, color: DarkThemeColors.textSecondary),
    labelLarge: TextStyle(fontSize: 12, color: DarkThemeColors.textSecondary),
    labelMedium: TextStyle(fontSize: 10, color: DarkThemeColors.textSecondary),
  ),
  extensions: [
    AppTypography(
      interBase: TextStyle(
        fontFamily: Utils.kInterFontFamily,
        color: DarkThemeColors.textPrimary,
      ),
    ),
  ],
);
