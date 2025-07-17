import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/utils/generate_stats.dart';
part 'pokemon_detail_state.dart';
part 'pokemon_detail_cubit.freezed.dart';

enum EnumPage { back, forward }

enum EnumGen {
  none,
  all,
  one,
  two,
  three,
  four,
  five,
  six,
  seven;

  String get getKey {
    switch (this) {
      case none:
        return '';
      case all:
        return '';
      case one:
        return kGen1;
      case two:
        return kGen2;
      case three:
        return kGen3;
      case four:
        return kGen4;
      case five:
        return kGen5;
      case six:
        return kGen6;
      case seven:
        return kGen7;
    }
  }
}

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit({
    required this.pokemonSelected,
    required this.gen,
    required this.pokemonRepository,
    required this.statsPokemonCubit,
  }) : super(PokemonDetailState(
          pokemonSelected: pokemonSelected,
          gen: gen,
          pokemonList: [],
          pokemonStatus: Status.initial,
          statsPokeonCubit: statsPokemonCubit,
        )) {
    initialize();
  }
  final PokemonModel pokemonSelected;
  final EnumGen gen;
  final PokemonRepository pokemonRepository;
  final StatsPokemonCubit statsPokemonCubit;

  initialize() async {
    if (gen == EnumGen.none) return;

    // recuper l'index del pokemon selezionato
    final pokemonsList = await pokemonRepository.fetchPokemonGen(gen);
    final indexInitial = pokemonsList.indexWhere(
      (element) {
        if (element.id == pokemonSelected.id) {}
        return element.id == pokemonSelected.id;
      },
    );

    // se il pokemon selezionato ha gia le statistiche aggiornate
    if (pokemonSelected.infoUpdate == true) {
      final stats = await generateStats(pokemonSelected);
      state.statsPokeonCubit.initialize(pokemon: pokemonSelected, stats: stats);
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
        manageStats: stats,
      ));
      return;
    }

    // se il pokemon selezionato non ha le statistiche aggiornate
    // faccio prima una verifica nell SP
    final pokemonById =
        await pokemonRepository.fetchPokemonById(pokemonSelected.id ?? '');
    if (pokemonById.infoUpdate == true) {
      // il pokemon selezionato recuperato dallo SP ha le statistiche aggiornate
      final stats = await generateStats(pokemonById);
      state.statsPokeonCubit.initialize(pokemon: pokemonById, stats: stats);
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
        pokemonSelected: pokemonById,
        manageStats: stats,
      ));
    } else {
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
      ));
      // il pokemon selezionato recuperato dallo SP non ha le statistiche aggiornate
      // perche è la prima volta che viene visualizzato
      final pokemonUpdate = await updateInfo(pokemonById);
      final updateList = await updateLocalList(pokemonUpdate);
      final stats = await generateStats(pokemonUpdate);
      state.statsPokeonCubit.initialize(pokemon: pokemonUpdate, stats: stats);
      emit(state.copyWith(
        pokemonList: updateList,
        initialIndex: indexInitial,
        pokemonSelected: pokemonUpdate,
        manageStats: stats,
      ));
    }
  }

  changePokemon(PokemonModel pokemon) async {
    if (pokemon.id == state.pokemonSelected.id) return;
    emit(state.copyWith(
      pokemonSelected: pokemon,
    ));
    state.statsPokeonCubit.initialize(pokemon: pokemon, stats: null);
    if (pokemon.infoUpdate != true) {
      final pokemonUpdate = await updateInfo(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      final stats = await generateStats(pokemonUpdate);
      state.statsPokeonCubit.initialize(pokemon: pokemonUpdate, stats: stats);
      emit(state.copyWith(
        pokemonList: updateList,
        pokemonSelected: pokemonUpdate,
        manageStats: stats,
      ));
    } else {
      final stats = await generateStats(pokemon);
      state.statsPokeonCubit.initialize(pokemon: pokemon, stats: stats);
      emit(state.copyWith(
        manageStats: stats,
      ));
    }
  }

  updateLocalList(PokemonModel pokemon) async {
    final currentList = state.pokemonList.toList();
    final index = currentList.indexWhere(
      (element) {
        return element.id == pokemon.id;
      },
    );
    currentList.removeAt(index);
    currentList.insert(index, pokemon);
    return currentList;
  }

  updateInfo(PokemonModel pokemon) async {
    final pokemonUpdate = await fetchInfoPokemon(
      int.parse(pokemon.id!.replaceAll("#", "")),
      pokemon,
    );
    await savePokemonUpdate(
      pokemon: pokemonUpdate,
      pokemonRepository: pokemonRepository,
    );
    return pokemonUpdate;
  }

  fetchInfoPokemon(int id, PokemonModel pokemon) async {
    return await pokemonRepository.fetchPokemonInfoById(
      id,
      pokemon,
    );
  }
}
