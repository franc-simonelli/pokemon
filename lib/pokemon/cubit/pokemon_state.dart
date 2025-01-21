part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState({
    required Status statusPagination,
    required List<PokemonModel> listPokemons,
    required int currentPage,
    required EnumGen gen,
    bool? isLastPage,
  }) = _PokemonState;
}
