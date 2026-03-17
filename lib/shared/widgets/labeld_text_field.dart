import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/size_extensions.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/shared/custom_text_field.dart';
import 'package:flutter_riverpod_template/shared/model/text_field_config.dart';
class LabeledTextField extends StatelessWidget {
  final TextFieldConfig model;
  const LabeledTextField({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.label,
            style: context.interBody(
              weight: FontWeight.w500,
              size: 14,
              color: context.theme.textfieldLabel,
            ),
          ),
          6.height,
          CustomTextField(
            descriptor: model.descriptor,
            suffixPath: model.suffixIconPath,
            prefixPath: model.prefixIconPath,
            obscureField: model.isObseure,
            nextFocusNode: model.nextFocusNode,
            keyBoardType: model.keyboardType,
            validator: model.validator,
            showDoneBtn: model.showDoneBtn,

            onFieldSubmitted: model.onFieldSubmitted,
          ),
        ],
      ),
    );
  }
}
