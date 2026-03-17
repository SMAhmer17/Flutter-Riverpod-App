import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';

enum ToastType { success, error }

class ToastUtils {
  static void showSuccess(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      ToastType.success,
      Icons.check_circle_outline,
    );
  }

  static void showError(BuildContext context, String message) {
    _showSnackBar(context, message, ToastType.error, Icons.error_outline);
  }

  static void _showSnackBar(
    BuildContext context,
    String message,
    ToastType type,
    IconData icon,
  ) {
    // Clear immediately for responsive feel
    ScaffoldMessenger.of(context).clearSnackBars();

    // Delay showing the snackbar until the next frame.
    // This ensures that if this was called immediately after a theme change,
    // the 'context' and 'Theme.of(context)' will provide the NEW theme colors.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!context.mounted) return;

      // Re-evaluate colors in case they changed during the frame
      // We use the provided backgroundColor as a fallback but prefer
      // getting it from the updated context if possible.
      // However, since ToastUtils.showSuccess(context, message)
      // was called with context.theme.primary, we need to make sure
      // showSuccess itself doesn't evaluate it too early.

      final Color backgroundColor = type == ToastType.success
          ? context.theme.primary
          : context.theme.error;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(icon, color: Colors.white, size: 20),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  message,
                  style: context.interBody(
                    size: 14,
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: backgroundColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
}
