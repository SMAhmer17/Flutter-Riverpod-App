import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/shared/custom_text_field.dart';

class TextFieldConfig {
  final InputDescriptor descriptor;
  final String label;
  final bool isObseure;
  final bool showDoneBtn;
  final String? prefixIconPath;
  final String? suffixIconPath;
  final FocusNode? nextFocusNode;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;

  TextFieldConfig({
    required this.descriptor,
    required this.label,
    this.isObseure = false,
    this.showDoneBtn = false,
    this.prefixIconPath,
    this.suffixIconPath,
    this.keyboardType,
    this.nextFocusNode,
    this.validator,
    this.onFieldSubmitted,
  });
}
