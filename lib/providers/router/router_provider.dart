import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lundi/config/route_names.dart';
import 'package:lundi/pages/homepage.dart';
import 'package:lundi/pages/screens/edit_screen.dart';
import 'package:lundi/pages/screens/home_screen.dart';
import 'package:lundi/pages/screens/plan_screen.dart';
import 'package:lundi/pages/screens/settings/forgot_password.dart';
import 'package:lundi/pages/screens/settings/settings_screen.dart';
import 'package:lundi/pages/screens/settings/sign_in.dart';
import 'package:lundi/pages/screens/settings/sign_up.dart';
import 'package:lundi/providers/auth_repository_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_provider.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey();

@riverpod
GoRouter route(Ref ref) {
  final authState = ref.watch(authStateStreamProvider);
  return GoRouter(
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScaffold(child: child);
        },
        routes: [
          GoRoute(
            path: "/home",
            name: RouteNames.home,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const HomeScreen(),
              );
            },
          ),
          GoRoute(
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const PlanScreen(),
              );
            },
            path: "/plan",
            name: RouteNames.plan,
          ),
          GoRoute(
            path: "/assist",
            name: RouteNames.assist,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const HomeScreen(),
              );
            },
          ),
          GoRoute(
            path: "/edit",
            name: RouteNames.edit,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const EditScreen(),
              );
            },
          ),
          GoRoute(
            path: "/settings",
            name: RouteNames.settings,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const SettingsScreen(),
              );
            },
          ),
          GoRoute(
            path: "/settings/sign_up",
            name: RouteNames.settingsSignUp,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const SignUp(),
              );
            },
          ),
          GoRoute(
            path: "/settings/sign_in",
            name: RouteNames.settingsSignIn,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const SignIn(),
              );
            },
          ),
          GoRoute(
            path: "/settings/forgot_password",
            name: RouteNames.settingsForgotPassword,
            pageBuilder: (context, state) {
              return buildFadeTransitionPage(
                state,
                child: const ForgotPassword(),
              );
            },
          ),
        ],
      ),
    ],
    onException: (context, state, router) => router.pushNamed(
      RouteNames.home,
      extra: state.error,
    ),
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    redirect: (context, state) async {
      switch (authState) {
        case AsyncLoading():
          return '/home';
        case AsyncError(error: _):
          return '/home'; // TODO Add error page
        case AsyncData(value: var _):
          final authenticated = authState.valueOrNull != null;
          final isAuthenticating =
              (state.matchedLocation == '/settings/sign_up' ||
                  state.matchedLocation == '/settings/sign_in' ||
                  state.matchedLocation == '/resetPassword');
          // final splashing = state.matchedLocation == '/splash';
          if (!authenticated) {
            return null;
          }

          final isAssistant = state.matchedLocation == '/assist';
          if (isAssistant) {
            return '/home';
          }

          // TODO Add email verification
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

CustomTransitionPage<dynamic> buildFadeTransitionPage(
  GoRouterState state, {
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (
      context,
      animation,
      secondaryAnimation,
      child,
    ) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
