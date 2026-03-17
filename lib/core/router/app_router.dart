import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod_template/core/providers/firebase_providers.dart';
import 'package:flutter_riverpod_template/core/router/app_route_constants.dart';
import 'package:flutter_riverpod_template/features/auth/presentation/login_screen.dart';
import 'package:flutter_riverpod_template/features/home/home_screen.dart';
import 'package:flutter_riverpod_template/features/settings/settings_screen.dart';
import 'package:flutter_riverpod_template/features/images/images_screen.dart';

// ————————————————— Navigator Key —————————————————

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

// ————————————————— Router Notifier —————————————————

/// Watches [authStateChangesProvider] and notifies GoRouter to re-evaluate
/// its redirect whenever the auth state changes (sign-in / sign-out).
class RouterNotifier extends AsyncNotifier<void> implements Listenable {
  VoidCallback? _routerListener;

  @override
  Future<void> build() async {
    // Re-run whenever auth state changes — triggers GoRouter redirect.
    ref.watch(authStateChangesProvider);
    _routerListener?.call();
  }

  /// Called by GoRouter on every navigation attempt.
  /// Returns a redirect path or `null` to allow navigation to proceed.
  String? redirect(BuildContext context, GoRouterState state) {
    final authState = ref.read(authStateChangesProvider);

    final bool isLoggedIn = authState.when(
      data: (user) => user != null,
      error: (_, _) => false,
      loading: () => false,
    );

    final bool isOnAuthRoute = state.matchedLocation == AppRoute.login;

    if (!isLoggedIn && !isOnAuthRoute) return AppRoute.login;
    if (isLoggedIn && isOnAuthRoute) return AppRoute.home;

    return null;
  }

  @override
  void addListener(VoidCallback listener) => _routerListener = listener;

  @override
  void removeListener(VoidCallback listener) => _routerListener = null;
}

final routerNotifierProvider =
    AsyncNotifierProvider<RouterNotifier, void>(RouterNotifier.new);

// ————————————————— Router Provider —————————————————

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppRoute.home,
    debugLogDiagnostics: kDebugMode,
    refreshListenable: notifier,
    redirect: notifier.redirect,
    routes: [
      // ————————————————— Auth —————————————————
      GoRoute(
        path: AppRoute.login,
        name: AppRouteName.login,
        builder: (context, state) => const LoginScreen(),
      ),

      // ————————————————— App —————————————————
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
