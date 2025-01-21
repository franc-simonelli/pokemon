// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

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
    fetchEvolutionLine();
  }
  final List<String> evolutionLine;
  final PokemonRepository pokemonRepository;

  fetchEvolutionLine() async {
    try {
      List<PokemonModel> evolutionLine = [];
      if (this.evolutionLine.isNotEmpty) {
        emit(state.copyWith(evolutionLineStatus: Status.loading));
        for (var item in state.evolutionLineId) {
          final pokemon = await pokemonRepository.fetchPokemonById(item);
          evolutionLine.add(pokemon);
        }
        emit(state.copyWith(
            evolutionLine: evolutionLine, evolutionLineStatus: Status.success));
      }
    } catch (e) {}
  }

  getPokemonFrom(String id) async {
    return await pokemonRepository.fetchPokemonById(id);
  }
}
