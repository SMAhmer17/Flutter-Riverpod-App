import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  final TextStyle interBase;
  // final TextStyle plusJakartaSansBase;
  // final TextStyle scheherazadeNewBase;

  const AppTypography({
    required this.interBase,
    // required this.plusJakartaSansBase,
    // required this.scheherazadeNewBase,
  });

  @override
  AppTypography copyWith({
    TextStyle? interBase,
    TextStyle? plusJakartaSansBase,
    TextStyle? scheherazadeNewBase,
  }) {
    return AppTypography(
      interBase: interBase ?? this.interBase,
      // plusJakartaSansBase: plusJakartaSansBase ?? this.plusJakartaSansBase,
      // scheherazadeNewBase: scheherazadeNewBase ?? this.scheherazadeNewBase,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }
    return AppTypography(
      interBase: TextStyle.lerp(interBase, other.interBase, t)!,
      // plusJakartaSansBase: TextStyle.lerp(
      //   plusJakartaSansBase,
      //   other.plusJakartaSansBase,
      //   t,
      // )!,
      // scheherazadeNewBase: TextStyle.lerp(
      //   scheherazadeNewBase,
      //   other.scheherazadeNewBase,
      //   t,
      // )!,
    );
  }
}
