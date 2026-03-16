import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/constants/colors/light_theme_colors.dart';
import 'package:flutter_riverpod_template/core/themes/app_typography.dart';
import 'package:flutter_riverpod_template/core/utils/utils.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme:
      ColorScheme.fromSeed(
        seedColor: LightThemeColors.primary, // Base purple/blue color
        brightness: Brightness.light,
        primary: LightThemeColors.primary,
      ).copyWith(
        primaryContainer: LightThemeColors.primaryLight,
        onPrimaryContainer: Colors.white,
        secondary: LightThemeColors.primaryLight,
        secondaryContainer: LightThemeColors.primaryLight,
        onSecondaryContainer: Colors.white,
        error: LightThemeColors.error,
        onError: Colors.white,
        surface: LightThemeColors.surface,
        onSurface: LightThemeColors.textPrimary,
      ),
  scaffoldBackgroundColor: LightThemeColors.background,
  appBarTheme: const AppBarTheme(
    backgroundColor: LightThemeColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
    centerTitle: false,
    iconTheme: IconThemeData(color: Colors.white),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: LightThemeColors.accent,
    foregroundColor: Colors.black,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: LightThemeColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: LightThemeColors.primary,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: LightThemeColors.primary),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: LightThemeColors.primary,
      side: const BorderSide(color: LightThemeColors.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
  cardTheme: const CardThemeData(
    color: LightThemeColors.surface,
    elevation: 2,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFF0F2F5),
    hintStyle: const TextStyle(color: LightThemeColors.hintText, fontSize: 14),
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: LightThemeColors.primary, width: 1.5),
    ),
    prefixIconColor: LightThemeColors.textSecondary,
    suffixIconColor: LightThemeColors.textSecondary,
  ),

  chipTheme: const ChipThemeData(
    backgroundColor: Color(0xFFE0E0E0),
    labelStyle: TextStyle(color: LightThemeColors.textPrimary),
    secondaryLabelStyle: TextStyle(color: Colors.white),
    selectedColor: LightThemeColors.primary,
    secondarySelectedColor: LightThemeColors.primaryLight,
    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
  ),
  iconTheme: const IconThemeData(color: LightThemeColors.textPrimary),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: LightThemeColors.textPrimary,
    ),
    headlineMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: LightThemeColors.textPrimary,
    ),
    headlineSmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: LightThemeColors.textPrimary,
    ),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: LightThemeColors.textPrimary,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: LightThemeColors.textPrimary,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: LightThemeColors.textPrimary,
    ),
    bodyLarge: TextStyle(fontSize: 14, color: LightThemeColors.textPrimary),
    bodyMedium: TextStyle(fontSize: 12, color: LightThemeColors.textSecondary),
    bodySmall: TextStyle(fontSize: 14, color: LightThemeColors.textSecondary),
    labelLarge: TextStyle(fontSize: 12, color: LightThemeColors.textSecondary),
    labelMedium: TextStyle(fontSize: 10, color: LightThemeColors.textSecondary),
  ),
  extensions: [
    AppTypography(
      interBase: TextStyle(
        fontFamily: Utils.kInterFontFamily,
        color: LightThemeColors.textPrimary,
      ),
      // plusJakartaSansBase: TextStyle(
      //   fontFamily: Utils.kPlusJakartaSansFontFamily,
      //   color: LightThemeColors.textPrimary,
      // ),
      // scheherazadeNewBase: TextStyle(
      //   fontFamily: Utils.kScheherazadeNewFontFamily,
      //   color: LightThemeColors.textPrimary,
      // ),
    ),
  ],
);
