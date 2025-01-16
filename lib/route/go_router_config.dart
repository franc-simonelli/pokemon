// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/views/application_page.dart';
import 'package:pokedex/features/bottom_navigation_bar.dart';
import 'package:pokedex/features/favorite/favorite_screen.dart';
import 'package:pokedex/features/home/home_page.dart';
import 'package:pokedex/features/regioni/regioni_screen.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex/search_pokemon/search_pokemon_page.dart';
import 'package:pokedex/search_pokemon/widgets/search_bar.dart';

abstract final class ScreenPaths {
  static const application = '/';
  static const home = '/home';
  static const regioni = '/regioni';
  static const favorite = '/favorite';
  static const searchPokemon = '/search-pokemon';
  static const detailPokemon = '/detail-pokemon';
}

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final goRouter = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: ScreenPaths.application,
  routes: [
    GoRoute(
      path: ScreenPaths.application,
      builder: (context, state) {
        return const ApplicationPage();
      },
    ),
    GoRoute(
      path: ScreenPaths.searchPokemon,
      builder: (context, state) {
        return const SearchPokemonPage();
      },
    ),
    GoRoute(
      path: ScreenPaths.detailPokemon,
      builder: (context, state) {
        Map<String, dynamic> map = state.extra as Map<String, dynamic>;
        return PokemonDetailPage(
          pokemonSelected: map['pokemonSelected'],
          gen: map['gen'],
        );
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
