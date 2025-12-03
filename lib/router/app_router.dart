import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/screens/screen_a.dart';
import '../ui/screens/screen_b.dart';
import '../ui/screens/screen_c.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/screen_a',
    routes: [
      GoRoute(
        path: '/screen_a',
        name: 'screen_a',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScreenA(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        ),
      ),
      GoRoute(
        path: '/screen_b',
        name: 'screen_b',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScreenB(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/screen_c',
        name: 'screen_c',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const ScreenC(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}