// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
part 'compares_state.dart';
part 'compares_cubit.freezed.dart';

class ComparesCubit extends Cubit<ComparesState> {
  ComparesCubit({
    required this.pokemonRepository,
    this.initialIndex,
  }) : super(
          ComparesState(
            pokemons: [],
            initialIndex: initialIndex,
          ),
        ) {
    initialize();
  }

  final PokemonRepository pokemonRepository;
  final int? initialIndex;

  initialize() async {
    try {
      final allPokemons = await pokemonRepository.fetchPokemonGen(EnumGen.all);
      final pokemon = allPokemons[initialIndex ?? 0];
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

    if (pokemon.statsUpdate != true) {
      final pokemonUpdate = await updateStats(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      emit(state.copyWith(
        pokemons: updateList,
        firstPokemonSelected: pokemonUpdate,
      ));
    }
  }

  changeSecondPokemon(PokemonModel pokemon) async {
    if (pokemon.id == state.secondPokemonSelected?.id) return;
    emit(state.copyWith(
      secondPokemonSelected: pokemon,
    ));

    if (pokemon.statsUpdate != true) {
      final pokemonUpdate = await updateStats(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      emit(state.copyWith(
        pokemons: updateList,
        secondPokemonSelected: pokemonUpdate,
      ));
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

  updateStats(PokemonModel pokemon) async {
    final pokemonUpdate = await fetchStatsPokemon(
      int.parse(pokemon.id!.replaceAll("#", "")),
      pokemon,
    );
    await savePokemonUpdate(
      pokemon: pokemonUpdate,
      pokemonRepository: pokemonRepository,
    );
    return pokemonUpdate;
  }

  fetchStatsPokemon(int id, PokemonModel pokemon) async {
    return await pokemonRepository.fetchPokemonStatsById(
      id,
      pokemon,
    );
  }
}
