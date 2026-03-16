import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_template/core/constants/prefs_keys.dart';
import 'package:flutter_riverpod_template/shared/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunction {
  HelperFunction._(); // prevent instantiation

  static OverlayEntry? _overlayEntry;

  static void showOverlay(BuildContext context) {
    if (_overlayEntry != null) return;

    final overlayState = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (context) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;
        return Positioned(
          left: 0,
          right: 0,
          bottom: bottomInset,
          child: Material(
            color: Colors.transparent,
            child: Container(
              color: CupertinoColors.secondarySystemBackground,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerRight,
                child: CupertinoButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    removeOverlay();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      color: CupertinoColors.activeBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    overlayState.insert(_overlayEntry!);
  }

  static void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  /// Attaches focus listeners to a list of [InputDescriptor]s so the iOS
  /// "Done" toolbar overlay is shown/hidden automatically.
  static void attachOverlayListeners(
    BuildContext context, {
    required List<InputDescriptor> descriptors,
  }) {
    for (var descriptor in descriptors) {
      descriptor.focusNode.addListener(() {
        if (descriptor.focusNode.hasFocus) {
          dev.log('${descriptor.controller.text} Focused');
          showOverlay(context);
        } else {
          removeOverlay();
          dev.log('Unfocused');
        }
      });
    }
  }

  /// Returns [true] on the very first launch, [false] on subsequent launches.
  /// Uses the centrally managed [PrefsKeys.isFirstTime] key.
  static Future<bool> checkIsFirstTime() async {
    final preferences = await SharedPreferences.getInstance();
    final isFirstTime = preferences.getBool(PrefsKeys.isFirstTime);
    if (isFirstTime == null) {
      await preferences.setBool(PrefsKeys.isFirstTime, false);
      return true;
    }
    return false;
  }

  /// Resets the first-time flag so the onboarding flow will show again.
  static Future<void> resetFirstTimeStatus() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(PrefsKeys.isFirstTime);
  }
}
