import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/themes/app_theme.dart';
import 'package:flutter_riverpod_template/core/themes/app_typography.dart';

extension AppThemeExtension on BuildContext {
  AppTheme get theme => AppTheme(
    Theme.of(this),
    isLight: Theme.of(this).brightness == Brightness.light,
  );
}

extension TypographyShorthand on BuildContext {
  AppTypography get _typo => Theme.of(this).extension<AppTypography>()!;

  TextStyle interBody({
    double? size,
    FontWeight? weight,
    Color? color,
    double? height,
    TextDecoration? decoration,
    TextDecorationStyle? decorationStyle,
  }) {
    return _typo.interBase.copyWith(
      fontSize: size,
      fontWeight: weight,
      color: color,
      height: height,
      decoration: decoration,
      decorationStyle: decorationStyle,
    );
  }

  // TextStyle plusJakartaSansBody({
  //   double? size,
  //   FontWeight? weight,
  //   Color? color,
  //   double? height,
  //   TextDecoration? decoration,
  //   TextDecorationStyle? decorationStyle,
  // }) {
  //   return _typo.plusJakartaSansBase.copyWith(
  //     fontSize: size,
  //     fontWeight: weight,
  //     color: color,
  //     height: height,
  //     decoration: decoration,
  //     decorationStyle: decorationStyle,
  //   );
  // }

  // TextStyle scheherazadeNewBody({
  //   double? size,
  //   FontWeight? weight,
  //   Color? color,
  //   double? height,
  //   TextDecoration? decoration,
  //   TextDecorationStyle? decorationStyle,
  // }) {
  //   return _typo.scheherazadeNewBase.copyWith(
  //     fontSize: size,
  //     fontWeight: weight,
  //     color: color,
  //     height: height,
  //     decoration: decoration,
  //     decorationStyle: decorationStyle,
  //   );
  // }
}
