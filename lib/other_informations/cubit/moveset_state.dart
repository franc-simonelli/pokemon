part of 'moveset_cubit.dart';

@freezed
class MovesetState with _$MovesetState {
  const factory MovesetState({
    required Status status,
    required List<AbilityModel> abilities,
    required List<MoveModel> moveLevelUp,
    required List<MoveModel> moveMachine,
    required List<MoveModel> moveEgg,
    required List<String> games,
    required String gameSelected,
    required bool showDownloadIcon,
    MovesetModel? moveset,
    PokemonModel? pokemon,
    Status? autoDownloadStatus,
    bool? isAllMovesDowloaded,
  }) = _MovesetState;
}
