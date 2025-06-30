// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/utils/generate_stats.dart';
part 'compares_state.dart';
part 'compares_cubit.freezed.dart';

class ComparesCubit extends Cubit<ComparesState> {
  ComparesCubit({
    required this.pokemonRepository,
    required this.statsFirstPokemonCubit,
    required this.statsSecondPokemonCubit,
    this.initialIndex,
  }) : super(
          ComparesState(
              pokemons: [],
              initialIndex: initialIndex,
              statsFirstPokemonCubit: statsFirstPokemonCubit,
              statsSecondPokemonCubit: statsSecondPokemonCubit),
        ) {
    initialize();
  }

  final StatsPokemonCubit statsFirstPokemonCubit;
  final StatsPokemonCubit statsSecondPokemonCubit;
  final PokemonRepository pokemonRepository;
  final int? initialIndex;

  initialize() async {
    try {
      final allPokemons = await pokemonRepository.fetchPokemonGen(EnumGen.all);
      final pokemon = allPokemons[initialIndex ?? 0];

      final statsFirstPokemon = await generateStats(pokemon);
      final statsSecondPokemon = await generateStats(allPokemons[0]);

      state.statsFirstPokemonCubit
          .initialize(pokemon: pokemon, stats: statsFirstPokemon);
      state.statsSecondPokemonCubit
          .initialize(pokemon: allPokemons[0], stats: statsSecondPokemon);
      emit(state.copyWith(
        pokemons: allPokemons,
        firstPokemonSelected: pokemon,
        secondPokemonSelected: allPokemons[0],
      ));
    } catch (e) {}
  }

  changeFirstPokemon(PokemonModel pokemon) async {
    if (pokemon.id == state.firstPokemonSelected?.id) return;
    emit(state.copyWith(
      firstPokemonSelected: pokemon,
    ));
    state.statsFirstPokemonCubit.initialize(pokemon: pokemon, stats: null);

    if (pokemon.infoUpdate != true) {
      // await Future.delayed(Duration(milliseconds: 1000));
      final pokemonUpdate = await updateInfo(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      final statsFirstPokemon = await generateStats(pokemonUpdate);
      state.statsFirstPokemonCubit
          .initialize(pokemon: pokemonUpdate, stats: statsFirstPokemon);
      emit(state.copyWith(
        pokemons: updateList,
        firstPokemonSelected: pokemonUpdate,
      ));
    } else {
      final statsFirstPokemon = await generateStats(pokemon);
      state.statsFirstPokemonCubit
          .initialize(pokemon: pokemon, stats: statsFirstPokemon);
    }
  }

  changeSecondPokemon(PokemonModel pokemon) async {
    if (pokemon.id == state.secondPokemonSelected?.id) return;
    emit(state.copyWith(
      secondPokemonSelected: pokemon,
    ));
    state.statsSecondPokemonCubit.initialize(pokemon: pokemon, stats: null);

    if (pokemon.infoUpdate != true) {
      // await Future.delayed(Duration(milliseconds: 1000));
      final pokemonUpdate = await updateInfo(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      final statsSecondPokemon = await generateStats(pokemonUpdate);
      state.statsSecondPokemonCubit
          .initialize(pokemon: pokemonUpdate, stats: statsSecondPokemon);
      emit(state.copyWith(
        pokemons: updateList,
        secondPokemonSelected: pokemonUpdate,
      ));
    } else {
      final statsSecondPokemon = await generateStats(pokemon);
      state.statsSecondPokemonCubit
          .initialize(pokemon: pokemon, stats: statsSecondPokemon);
    }
  }

  updateLocalList(PokemonModel pokemon) async {
    final currentList = state.pokemons.toList();
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
