// Screen Height and Screen Width Extension Method
import 'package:flutter/material.dart';

extension SizeExtension on num {
  double get sh =>
      WidgetsBinding
          .instance
          .platformDispatcher
          .views
          .first
          .physicalSize
          .height /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio *
      this;
  double get sw =>
      WidgetsBinding
          .instance
          .platformDispatcher
          .views
          .first
          .physicalSize
          .width /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio *
      this;
}

extension IntToSizedBox on num {
  Widget get height => SizedBox(height: toDouble());

  Widget get width => SizedBox(width: toDouble());
}
