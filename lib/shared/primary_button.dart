import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';
import 'package:flutter_riverpod_template/shared/text_styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final bool isLoading;


  final double borderRadius;

  const PrimaryButton({
    super.key,
    required this.title,
    this.onTap,
    this.isLoading = false,
    this.borderRadius = 16, 
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 54.5,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: context.theme.buttonGradient,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 6,
              spreadRadius: -4,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 15,
              spreadRadius: -3,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          splashColor: Colors.white.withValues(alpha: 0.2),
          highlightColor: Colors.white.withValues(alpha: 0.1),
          onTap: onTap == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  FocusScope.of(context).unfocus();
                  onTap!();
                },
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: context.theme.onboardingHeadingText,
                    backgroundColor: context.theme.background,
                  ),
                )
              : Center(
                  child: Text(
                    title,
                    style: context.interBody(
                      size: 16,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

// ===== Custom Outline Button =====

class CustomOutlineButton extends StatelessWidget {
  final double? btnHeight;
  final double? btnWidth;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final String text;
  final double fontSize;
  final FontWeight weight;
  final bool isLoading;
  final bool useInterStyle;
  final double horizontalPadding;
  final double bottomPadding;
  final Color? outlineColor;
  final Color? textColor;

  const CustomOutlineButton({
    super.key,
    this.onPressed,
    required this.text,
    this.fontSize = 14,
    this.weight = FontWeight.w400,
    this.isLoading = false,
    this.useInterStyle = true,
    this.horizontalPadding = 0,
    this.bottomPadding = 20,
    this.btnHeight,
    this.btnWidth,
    this.outlineColor,
    this.textColor,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Padding(
      padding: EdgeInsets.only(
        bottom: bottomPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: SizedBox(
        width: btnWidth ?? double.infinity,
        height: btnHeight ?? 56,
        child: OutlinedButton(
          onPressed: isDisabled
              ? null
              : onPressed == null
              ? null
              : () {
                  HapticFeedback.lightImpact();
                  onPressed!();
                },
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: outlineColor ?? theme.primary, width: 2),
            foregroundColor: textColor ?? theme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(28),
            ),
          ),
          child: isLoading
              ? CircularProgressIndicator.adaptive(
                  backgroundColor: theme.primary,
                )
              : Text(
                  text,
                  style: useInterStyle
                      ? subTitleTextStyle(
                          weight: weight,
                          size: fontSize,
                          color: textColor ?? theme.primary,
                        )
                      : interTextStyle(
                          weight: weight,
                          size: fontSize,
                          color: textColor ?? theme.primary,
                        ),
                ),
        ),
      ),
    );
  }
}
