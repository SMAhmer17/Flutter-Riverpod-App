import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/constants/icons/app_icons.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/core/helpers/helper_function.dart';
import 'package:flutter_riverpod_template/core/providers/assets_provider.dart';
import 'package:flutter_riverpod_template/shared/tap_widget.dart';
import 'package:flutter_svg/svg.dart';

OutlineInputBorder getBorder(
  double? borderRadius, {
  required BuildContext context,
  bool isEnabled = true,
  bool isError = false,
}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius ?? 24),
    borderSide: BorderSide(
      width: 1.88,
      color: isError
          ? context.theme.error
          : isEnabled
          ? context.theme.textfieldEnabledBorder
          : context.theme.textfieldBorder,
    ),
  );
}

/// Encapsulates a [TextEditingController] and [FocusNode] pair.
/// Dispose via [dispose()] when the owning widget is removed.
class InputDescriptor {
  late TextEditingController controller;
  late FocusNode focusNode;
  final String? label;
  final String? hinttext;

  InputDescriptor({String? initialValue, this.label, this.hinttext}) {
    controller = TextEditingController(text: initialValue);
    focusNode = FocusNode();
  }

  void clear() {
    controller.clear();
    focusNode.unfocus();
  }

  void dispose() {
    controller.dispose();
    focusNode.dispose();
  }

  void setText(String vl) {
    controller.text = vl;
  }

  String get text => controller.text.trim();
}

class CustomTextField extends ConsumerStatefulWidget {
  final InputDescriptor descriptor;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final FocusNode? nextFocusNode;
  final String? prefixPath, suffixPath;
  final int? maxLines;
  final bool showLabel;

  /// Whether the field is enabled for user input. Defaults to [true].
  final bool isEnabled;

  /// Pass [true] to render the field as a password input with a
  /// show/hide toggle icon.
  final bool obscureField;
  final Color? fillColor;
  final bool expands;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyBoardType;
  final Function()? onTap;
  final double? borderRadius;
  final bool showDoneBtn;
  final Function(String)? onFieldSubmitted;

  const CustomTextField({
    super.key,
    required this.descriptor,
    this.readOnly = false,
    this.onTap,
    this.fillColor,
    this.isEnabled = false,
    this.expands = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyBoardType,
    this.onChange,
    this.validator,
    this.textAlign,
    this.textStyle,
    this.borderRadius,
    this.onFieldSubmitted,
    this.showDoneBtn = false,
    this.maxLines = 1,
    this.textInputAction = TextInputAction.next,
    this.nextFocusNode,
    this.showLabel = false,
    this.obscureField = false,
    this.prefixPath,
    this.suffixPath,
    this.inputFormatters,
  });

  @override
  ConsumerState<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  // ✅ Fixed: ValueNotifier lives in State so it can be properly disposed.
  late final ValueNotifier<bool> _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = ValueNotifier<bool>(widget.obscureField);

    if (Platform.isIOS && widget.showDoneBtn) {
      widget.descriptor.focusNode.addListener(_handleFocusChange);
    }
  }

  void _handleFocusChange() {
    if (widget.descriptor.focusNode.hasFocus) {
      log('CustomTextField focused');
      HelperFunction.showOverlay(context);
    } else {
      HelperFunction.removeOverlay();
      log('CustomTextField unfocused');
    }
  }

  @override
  void dispose() {
    _obscureText.dispose(); // ✅ Fixed: was never disposed before
    if (Platform.isIOS && widget.showDoneBtn) {
      widget.descriptor.focusNode.removeListener(_handleFocusChange);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appIcons = ref.watch(appIconsProvider);
    return Focus(
      onFocusChange: (_) => (context as Element).markNeedsBuild(),
      child: ValueListenableBuilder(
        valueListenable: _obscureText,
        builder: (context, obscureText, _) {
          final inputDecoration = InputDecoration(
            hintStyle: context.interBody(color: context.theme.hintText),
            hintText: widget.descriptor.hinttext,
            suffixIcon:
                widget.suffixIcon ??
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: widget.obscureField
                      ? _secureIcon(obscureText, appIcons)
                      : _suffixIcon,
                ),
            prefixIcon: widget.prefixIcon ?? _prefixIcon,
            fillColor: widget.fillColor ?? context.theme.textfieldFill,
            contentPadding: EdgeInsets.only(
              right: widget.prefixPath != null ? 0 : 24,
              left: widget.prefixPath != null ? 0 : 24,
              top: 18,
              bottom: 18,
            ),
            border: getBorder(
              widget.borderRadius ?? 16,
              context: context,
              isEnabled: widget.isEnabled,
            ),
            enabledBorder: getBorder(
              widget.borderRadius ?? 16,
              context: context,
              isEnabled: widget.isEnabled,
            ),
            disabledBorder: getBorder(
              widget.borderRadius ?? 16,
              context: context,
              isEnabled: widget.isEnabled,
            ),
            focusedBorder: getBorder(
              widget.borderRadius ?? 16,
              context: context,
              isEnabled: true,
            ),
            errorBorder: getBorder(
              widget.borderRadius ?? 16,
              context: context,
              isError: true,
              isEnabled: true,
            ),
          );
          return TextFormField(
            onTap: widget.onTap,
            maxLines: widget.maxLines,
            controller: widget.descriptor.controller,
            focusNode: widget.descriptor.focusNode,
            keyboardType: widget.keyBoardType,
            readOnly: widget.readOnly,
            onChanged: widget.onChange,
            validator: widget.validator,
            expands: widget.expands,
            clipBehavior: Clip.none,
            style:
                widget.textStyle ??
                context.interBody(color: context.theme.textfieldLabel),
            textAlignVertical: TextAlignVertical.center,
            textAlign: widget.textAlign ?? TextAlign.start,
            inputFormatters: widget.inputFormatters,
            onFieldSubmitted:
                widget.onFieldSubmitted ??
                (_) {
                  if (widget.nextFocusNode != null) {
                    widget.nextFocusNode!.requestFocus();
                  } else {
                    widget.descriptor.focusNode.unfocus();
                  }
                },
            obscureText: obscureText,
            decoration: inputDecoration,
          );
        },
      ),
    );
  }

  Widget? get _suffixIcon {
    if (widget.suffixPath == null) return null;
    return UnconstrainedBox(
      child: SvgPicture.asset(
        colorFilter: ColorFilter.mode(context.theme.primary, BlendMode.srcIn),
        height: 24,
        widget.suffixPath!,
      ),
    );
  }

  Widget? get _prefixIcon {
    if (widget.prefixPath == null) return null;
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 8),
      child: UnconstrainedBox(
        child: SvgPicture.asset(height: 24, width: 24, widget.prefixPath!),
      ),
    );
  }

  Widget? _secureIcon(bool secure, AppIcons appIcons) {
    return UnconstrainedBox(
      child: TapWidget(
        padding: const EdgeInsets.all(7),
        onTap: () => _obscureText.value = !_obscureText.value,
        child: SvgPicture.asset(
          secure ? appIcons.invisible : appIcons.visible,
          height: 20,
          colorFilter: ColorFilter.mode(
            context.theme.textfieldIcon,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
