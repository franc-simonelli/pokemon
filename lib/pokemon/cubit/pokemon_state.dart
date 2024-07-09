part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState({
    required Status downloadStatus,
    required Status restorePokemonStatus,
    required Status statusPagination,
    required List<PokemonModel> allPokemons,
    required List<PokemonModel> filterPokemon,
    required List<PokemonModel> pokemon1,
    required List<PokemonModel> pokemon2,
    required List<PokemonModel> pokemon3,
    required List<PokemonModel> pokemon4,
    required List<PokemonModel> pokemon5,
    required List<PokemonModel> pokemon6,
    required List<PokemonModel> pokemon7,
    bool? isLastPage,
    int? nextPageKey,
    required String filterText,
    required List<String> filterTypes,
  }) = _PokemonState;
}
