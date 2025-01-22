part of 'moveset_cubit.dart';

@freezed
class MovesetState with _$MovesetState {
  const factory MovesetState({
    required Status status,
    MovesetModel? moveset,
    PokemonModel? pokemon,
  }) = _MovesetState;
}
