// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/bottom_navigation_bar.dart';
import 'package:pokedex/features/favorite/favorite_screen.dart';
import 'package:pokedex/features/home/home_screen.dart';
import 'package:pokedex/features/regioni/regioni_screen.dart';
import 'package:pokedex/features/splash/splash_screen.dart';

abstract final class ScreenPaths {
  static const splash = '/splash';
  static const home = '/home';
  static const regioni = '/regioni';
  static const favorite = '/favorite';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: ScreenPaths.splash,
  routes: [
    GoRoute(
      path: ScreenPaths.splash,
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => BottomNavigationScreen(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.home,
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.regioni,
              builder: (context, state) {
                return const RegioniScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: ScreenPaths.favorite,
              builder: (context, state) {
                return const FavoriteScreen();
              },
            ),
          ],
        ),
      ],
    )
  ],
);
