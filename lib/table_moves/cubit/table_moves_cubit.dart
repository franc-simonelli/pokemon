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
    // required this.gameTabCubit,
  }) : super(TableMovesState(
          moves: [],
          movesStatus: Status.initial,
          moveLevelUp: [],
          moveMachine: [],
        )) {
    initialize();
    // _gameTabSubscription = gameTabCubit.stream.listen(_onGameTabChanged);
  }

  // late final StreamSubscription<GameTabState> _gameTabSubscription;
  final String id;
  final PokemonRepository pokemonRepository;
  // final GameTabCubit gameTabCubit;

  // Future<void> _onGameTabChanged(GameTabState state) async {
  //   if (state.gameSelected.isNotEmpty) {
  //     changeGameSelected(state.gameSelected);
  //   }
  // }

  changeGameSelected(String game) {
    final filterMoves = filterMovesByGame(state.moves, game);

    List<MoveModel> movesOrder = [];
    final levelUp = filterMoves['levelUp'] as List<MoveModel>;
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
      moveLevelUp: movesOrder,
      moveMachine: filterMoves['machine'],
      moveEgg: filterMoves['egg'],
    ));
  }

  initialize() async {
    try {
      final pokemon = await pokemonRepository.fetchPokemonById(id);
      final currentMoves = pokemon.moveset?.moves?.toList() ?? [];

      // await gameTabCubit.fetchGames(currentMoves);

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
