import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_template/core/providers/theme_notifier_provider.dart';
import 'package:flutter_riverpod_template/core/router/app_router.dart';
import 'package:flutter_riverpod_template/core/themes/dark_theme.dart';
import 'package:flutter_riverpod_template/core/themes/light_theme.dart';
import 'package:flutter_riverpod_template/i18n/strings.g.dart';

class FlutterRiverpodApp extends ConsumerWidget {
  const FlutterRiverpodApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Flutter Riverpod Template',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      locale: TranslationProvider.of(context).locale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
    );
  }
}
