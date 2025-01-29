part of 'moveset_cubit.dart';

@freezed
class MovesetState with _$MovesetState {
  const factory MovesetState({
    required Status status,
    required List<AbilityModel> abilities,
    required List<MoveModel> moveLevelUp,
    required List<MoveModel> moveMachine,
    MovesetModel? moveset,
    PokemonModel? pokemon,
    Status? autoDownloadStatus,
    bool? isAllMovesDowloaded,
  }) = _MovesetState;
}
