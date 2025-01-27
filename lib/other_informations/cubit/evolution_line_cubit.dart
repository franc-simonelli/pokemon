// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';

part 'evolution_line_state.dart';
part 'evolution_line_cubit.freezed.dart';

class EvolutionLineCubit extends Cubit<EvolutionLineState> {
  EvolutionLineCubit({
    required this.evolutionLine,
    required this.pokemonRepository,
  }) : super(
          EvolutionLineState(
            evolutionLineId: evolutionLine,
            evolutionLine: [],
            evolutionLineStatus: Status.initial,
          ),
        ) {
    // fetchEvolutionLine();
  }
  final List<String> evolutionLine;
  final PokemonRepository pokemonRepository;

  fetchEvolutionLine() async {
    try {
      emit(state.copyWith(evolutionLineStatus: Status.loading));
      List<PokemonModel> evolutionLine = [];
      if (this.evolutionLine.isNotEmpty) {
        for (var item in state.evolutionLineId) {
          final pokemon = await pokemonRepository.fetchPokemonById(item);
          final pokemonUpdate = await checkPokemonStats(pokemon);
          evolutionLine.add(pokemonUpdate);
        }
        emit(
          state.copyWith(
            evolutionLine: evolutionLine,
            evolutionLineStatus: Status.success,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(evolutionLineStatus: Status.error));
    }
  }

  getPokemonByIdFromState(String id) {
    final currentListPokemon = state.evolutionLine.toList();
    return currentListPokemon.firstWhere((element) => element.id == id);
  }

  checkPokemonStats(PokemonModel pokemon) async {
    if (pokemon.infoUpdate != true) {
      return await updateInfo(pokemon);
    } else {
      return pokemon;
    }
  }

  getPokemonFrom(String id) async {
    return await pokemonRepository.fetchPokemonById(id);
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
