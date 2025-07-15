import 'package:feature_auth/presentation/providers/auth_repository_provider.dart';
import 'package:feature_auth/presentation/screens/forgot_password.dart';
import 'package:feature_auth/presentation/screens/settings_screen.dart';
import 'package:feature_auth/presentation/screens/sign_in.dart';
import 'package:feature_auth/presentation/screens/sign_up.dart';
import 'package:feature_edit/presentation/pages/edit_screen.dart';
import 'package:feature_home/presentation/pages/home_screen.dart';
import 'package:feature_home/presentation/pages/homepage.dart';
import 'package:feature_plan/presentation/pages/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared/config/route_names.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();

/// Route Provider
@riverpod
GoRouter route(Ref ref) {
  final authState = ref.watch(authStateStreamProvider);
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: RouteNames.home,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const PlanScreen(),
            ),
            path: '/plan',
            name: RouteNames.plan,
          ),
          GoRoute(
            path: '/assist',
            name: RouteNames.assist,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: '/edit',
            name: RouteNames.edit,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const EditScreen(),
            ),
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const SettingsScreen(),
            ),
          ),
          GoRoute(
            path: '/settings/sign_up',
            name: RouteNames.settingsSignUp,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const SignUp(),
            ),
          ),
          GoRoute(
            path: '/settings/sign_in',
            name: RouteNames.settingsSignIn,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const SignIn(),
            ),
          ),
          GoRoute(
            path: '/settings/forgot_password',
            name: RouteNames.settingsForgotPassword,
            pageBuilder: (context, state) => buildFadeTransitionPage(
              state,
              child: const ForgotPassword(),
            ),
          ),
        ],
      ),
    ],
    onException: (context, state, router) =>
        router.pushNamed(RouteNames.home, extra: state.error),
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) {
      switch (authState) {
        case AsyncLoading():
          return '/home';
        case AsyncError(error: _):
          return '/home'; // TODO(kano): Add error page
        case AsyncData(value: var _):
          final authenticated = authState.valueOrNull != null;
          final isAuthenticating =
              state.matchedLocation == '/settings/sign_up' ||
              state.matchedLocation == '/settings/sign_in' ||
              state.matchedLocation == '/resetPassword';
          // final splashing = state.matchedLocation == '/splash';
          if (!authenticated) {
            return null;
          }

          final isAssistant = state.matchedLocation == '/assist';
          if (isAssistant) {
            return '/home';
          }

          // TODO(kano): Add email verification
          // if (kFbAuth.currentUser!.emailVerified) {
          //   return '/verifyEmail';
          // }
          final verifyingEmail = state.matchedLocation == '/verifyEmail';

          // if (splashing) {
          //   return await Future.delayed(Duration(seconds: 5), () => '/home');
          // }
          return (isAuthenticating || verifyingEmail) ? '/home' : null;
      }

      return null;
    },
  );
}

/// Fade transition
CustomTransitionPage<dynamic> buildFadeTransitionPage(
  GoRouterState state, {
  required Widget child,
}) => CustomTransitionPage(
  key: state.pageKey,
  child: child,
  transitionsBuilder: (context, animation, secondaryAnimation, child) =>
      FadeTransition(
        opacity: animation,
        child: child,
      ),
);
