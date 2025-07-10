part of 'favorites_cubit.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    required Status favoriteState,
    required List<PokemonModel> pokemons,
  }) = _FavoritesState;
}
