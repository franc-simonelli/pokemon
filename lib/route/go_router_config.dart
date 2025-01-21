// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/views/application_page.dart';
import 'package:pokedex/counties/country_pokemon_list_page.dart';
import 'package:pokedex/features/bottom_navigation_bar.dart';
import 'package:pokedex/counties/countries_page.dart';
import 'package:pokedex/features/favorite/favorite_screen.dart';
import 'package:pokedex/features/home/home_page.dart';
import 'package:pokedex/other_informations/pages/other_information_page.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/pokemon_detail/pokemon_detail_page.dart';
import 'package:pokedex/search_pokemon/search_pokemon_page.dart';

abstract final class ScreenPaths {
  static const application = '/';
  static const home = '/home';
  static const countries = '/countries';
  static const favorite = '/favorite';
  static const searchPokemon = '/search-pokemon';
  static const detailPokemon = '/detail-pokemon';
  static const otherInformationPokemon = '/other-info-pokemon';
  static const pokemonCountries = '/pokemonCountries';
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
    GoRoute(
      path: ScreenPaths.otherInformationPokemon,
      builder: (context, state) {
        PokemonModel pokemon = state.extra as PokemonModel;
        return OtherInformation(
          pokemon: pokemon,
        );
      },
    ),
    GoRoute(
      path: ScreenPaths.pokemonCountries,
      builder: (context, state) {
        EnumGen gen = state.extra as EnumGen;
        return CountryPokemonListPage(
          gen: gen,
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
              path: ScreenPaths.countries,
              builder: (context, state) {
                return const CountryPage();
              },
            ),
            // GoRoute(
            //   path: ScreenPaths.pokemonCountries,
            //   builder: (context, state) {
            //     EnumGen gen = state.extra as EnumGen;
            //     return CountryPokemonListPage(
            //       gen: gen,
            //     );
            //   },
            // ),
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
