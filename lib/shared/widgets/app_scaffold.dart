
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod_template/core/extensions/theme_extension.dart';


class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? drawer;
  final Widget? endDrawer;
  final Widget? bottomSheet;
  final bool resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;

  final Color? backgroundColor;

  final bool? useLightStatusBarIcons;

  /// When set, the nav bar background deviates from [backgroundColor].
  final Color? navigationBarColor;

  /// When `true` the status bar is transparent (content scrolls under it).
  /// Pair with [extendBodyBehindAppBar] = `true`.
  final bool transparentStatusBar;


  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.drawer,
    this.endDrawer,
    this.bottomSheet,
    this.resizeToAvoidBottomInset = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.backgroundColor,
    this.useLightStatusBarIcons,
    this.navigationBarColor,
    this.transparentStatusBar = false,
  });

  // ————————————————— Build —————————————————

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bgColor = backgroundColor ?? theme.background;
    final navColor = navigationBarColor ?? bgColor;

    final isLight = useLightStatusBarIcons != null
        ? !useLightStatusBarIcons!                  // explicit override
        : ThemeData.estimateBrightnessForColor(bgColor) == Brightness.light;

    final iconBrightness = isLight ? Brightness.dark : Brightness.light;

    // ————————————————— System UI Overlay Style —————————————————

    final overlayStyle = SystemUiOverlayStyle(
      // Status bar
      statusBarColor: transparentStatusBar ? Colors.transparent : bgColor,
      statusBarBrightness: isLight ? Brightness.light : Brightness.dark, // iOS
      statusBarIconBrightness: iconBrightness,                            // Android

      // Navigation bar
      systemNavigationBarColor: navColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          ThemeData.estimateBrightnessForColor(navColor) == Brightness.light
              ? Brightness.dark
              : Brightness.light,
    );

    // ————————————————— Widget Tree —————————————————

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: overlayStyle,
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        drawer: drawer,
        endDrawer: endDrawer,
        bottomSheet: bottomSheet,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
      ),
    );
  }
}
