part of 'table_moves_cubit.dart';

@freezed
class TableMovesState with _$TableMovesState {
  const factory TableMovesState({
    required List<MoveModel> moves,
    required Status movesStatus,
    PokemonModel? pokemon,
    required List<MoveModel> moveLevelUp,
    required List<MoveModel> moveMachine,
  }) = _TableMovesState;
}
