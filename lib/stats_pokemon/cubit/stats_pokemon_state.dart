part of 'stats_pokemon_cubit.dart';

@freezed
class StatsPokemonState with _$StatsPokemonState {
  const factory StatsPokemonState({
    PokemonModel? pokemon,
    StatsValueModel? statsBase,
    StatsValueModel? stats,
    required int level,
    required bool showLvSlider,
    required Nature nature,
  }) = _StatsPokemonState;
}
