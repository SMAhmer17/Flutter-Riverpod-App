import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/utils/utils.dart';

TextStyle interTextStyle({
  FontWeight? weight,
  double? size,
  Color? color,
  double? height,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return TextStyle(
    fontFamily: Utils.kInterFontFamily,
    fontWeight: weight ?? FontWeight.w500,
    color: color,
    fontSize: size ?? 16,
    height: height,
    fontFeatures: fontFeatures,
    decoration: decoration,
    decorationColor: decorationColor,
  );
}

TextStyle subTitleTextStyle({
  FontWeight? weight,
  double? size,
  Color? color,
  double? height,
}) {
  return TextStyle(
    fontFamily: Utils.kInterFontFamily,
    fontWeight: weight ?? FontWeight.w400,
    color: color,
    fontSize: size ?? 14,
    height: height,
  );
}
