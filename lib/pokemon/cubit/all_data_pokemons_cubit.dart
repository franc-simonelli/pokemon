import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
part 'all_data_pokemons_state.dart';

class AllDataPokemonsCubit extends Cubit<AllDataPokemonsState> {
  AllDataPokemonsCubit({
    required this.pokemonRepository,
  }) : super(const AllDataPokemonsState());

  final PokemonRepository pokemonRepository;

  Future<void> fetchAllData() async {
    emit(state.copyWith(fetchStatus: Status.loading));
    try {
      final obj = await pokemonRepository.fetchAllData();
      emit(state.copyWith(
        firstGen: obj['1_gen'],
        secondGen: obj['2_gen'],
        thirdGen: obj['3_gen'],
        fourthGen: obj['4_gen'],
        fifthGen: obj['5_gen'],
        sixthGen: obj['6_gen'],
        seventhGen: obj['7_gen'],
        fetchStatus: Status.success,
      ));
    } on TimeoutException catch (_) {
      emit(state.copyWith(fetchStatus: Status.error));
    } catch (e) {
      emit(state.copyWith(fetchStatus: Status.error));
      addError(e);
    }
  }

  Future<List<PokemonModel>> fetchPokemonsByGen({
    required EnumGen gen,
  }) async {
    switch (gen) {
      case EnumGen.one:
        return state.firstGen ?? [];
      case EnumGen.two:
        return state.secondGen ?? [];
      case EnumGen.three:
        return state.thirdGen ?? [];
      case EnumGen.four:
        return state.fourthGen ?? [];
      case EnumGen.five:
        return state.fifthGen ?? [];
      case EnumGen.six:
        return state.sixthGen ?? [];
      case EnumGen.seven:
        return state.seventhGen ?? [];
      default:
        return [];
    }
  }
}
