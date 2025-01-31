part of 'pokemon_detail_cubit.dart';

@freezed
class PokemonDetailState with _$PokemonDetailState {
  const factory PokemonDetailState({
    required PokemonModel pokemonSelected,
    required EnumGen gen,
    required Status pokemonStatus,
    required List<PokemonModel> pokemonList,
    int? initialIndex,
    StatsValueModel? manageStats,
    required StatsPokemonCubit statsPokeonCubit,
  }) = _PokemonDetailState;

  const PokemonDetailState._();

  bool get firstPokemon {
    final index =
        pokemonList.indexWhere((element) => element.id == pokemonSelected.id);
    return index == 0;
  }

  bool get lastPokemon {
    final index =
        pokemonList.indexWhere((element) => element.id == pokemonSelected.id);
    return index == pokemonList.length - 1;
  }
}
