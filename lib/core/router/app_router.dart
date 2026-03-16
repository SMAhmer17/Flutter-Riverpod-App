import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod_template/core/router/app_route_constants.dart';
import 'package:flutter_riverpod_template/features/home/home_screen.dart';
import 'package:flutter_riverpod_template/features/settings/settings_screen.dart';
import 'package:flutter_riverpod_template/features/images/images_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.home,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: AppRoute.home,
        name: AppRouteName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRoute.settings,
        name: AppRouteName.settings,
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: AppRoute.images,
        name: AppRouteName.images,
        builder: (context, state) => const ImagesScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('No route defined for ${state.uri}')),
    ),
  );
});
