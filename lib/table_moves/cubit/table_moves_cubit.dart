// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/utils/filter_moves_by_version.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

part 'table_moves_state.dart';
part 'table_moves_cubit.freezed.dart';

class TableMovesCubit extends Cubit<TableMovesState> {
  TableMovesCubit({
    required this.id,
    required this.pokemonRepository,
  }) : super(TableMovesState(
          moves: [],
          movesStatus: Status.initial,
          moveLevelUp: [],
          moveMachine: [],
        )) {
    initialize();
  }

  final String id;
  final PokemonRepository pokemonRepository;

  initialize() async {
    try {
      final pokemon = await pokemonRepository.fetchPokemonById(id);
      final currentMoves = pokemon.moveset?.moves?.toList() ?? [];

      final filter = await filterScarletAndViolet(currentMoves);
      // moves = await orderMoves(currentMoves, pokemon.typeofpokemon![0]);
      // final levelUp = await orderByLevel(filter['levelUp']);
      // final machine = await orderByLevel(filter['machine']);

      List<MoveModel> movesOrder = [];
      final levelUp = filter['levelUp'] as List<MoveModel>;
      List<MoveModel> moveslevel = [];
      List<MoveModel> movesEvo = [];
      try {
        for (var item in levelUp) {
          if (item.versionGroupDetailsModel![0].levelLearnedAt == 0) {
            movesEvo.add(item);
          } else {
            moveslevel.add(item);
          }
        }
      } catch (e) {}

      final levelUpMovesOrder = orderByLevel(moveslevel);
      movesOrder.addAll(levelUpMovesOrder);
      movesOrder.addAll(movesEvo);

      emit(state.copyWith(
        pokemon: pokemon,
        moves: currentMoves,
        movesStatus: Status.success,
        moveLevelUp: movesOrder,
        moveMachine: filter['machine'],
      ));
    } catch (e) {
      emit(state.copyWith(movesStatus: Status.error));
    }
  }

  List<MoveModel> orderByLevel(List<MoveModel> list) {
    list.sort((a, b) => a.versionGroupDetailsModel![0].levelLearnedAt!
        .compareTo(b.versionGroupDetailsModel![0].levelLearnedAt!));

    return list;
  }
}
