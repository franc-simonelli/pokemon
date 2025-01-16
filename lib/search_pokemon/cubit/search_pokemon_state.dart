part of 'search_pokemon_cubit.dart';

@freezed
class SearchPokemonState with _$SearchPokemonState {
  const factory SearchPokemonState({
    required List<PokemonModel> chronology,
    required List<PokemonModel> pokemons,
    required Status pokemonsStatus,
    required Status chronologyStatus,
    String? filterText,
  }) = _SearchPokemonState;
}
