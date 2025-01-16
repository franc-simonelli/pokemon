part of 'evolution_line_cubit.dart';

@freezed
class EvolutionLineState with _$EvolutionLineState {
  const factory EvolutionLineState({
    required List<String> evolutionLineId,
    required List<PokemonModel> evolutionLine,
    required Status evolutionLineStatus,
  }) = _EvolutionLineState;
}
