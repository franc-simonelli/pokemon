import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/loading/loading_notifier.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/service/context_service.dart';
import 'package:pokedex/service/shared_preferences_service.dart';

ContextService get contextService => GetIt.I.get<ContextService>();
BuildContext get globalContext => contextService.context;
LoadingNotifier get loadingNotifier => GetIt.I.get<LoadingNotifier>();
PokemonRepository get pokemonRepository => GetIt.I.get<PokemonRepository>();
SharedPreferenceService get sharedPrefsService =>
    GetIt.I.get<SharedPreferenceService>();
