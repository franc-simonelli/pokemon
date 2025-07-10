import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

part 'favorites_state.dart';
part 'favorites_cubit.freezed.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit({
    required this.pokemonRepository,
  }) : super(FavoritesState(
          favoriteState: Status.initial,
          pokemons: [],
        ));

  final PokemonRepository pokemonRepository;

  fetchFavorites() async {
    emit(state.copyWith(favoriteState: Status.loading));
    final favorites = await pokemonRepository.fetchFavoritePokemons();
    emit(state.copyWith(
      pokemons: favorites,
      favoriteState: Status.success,
    ));
  }

  addFavoritePokemon(PokemonModel pokemon) async {
    try {
      await pokemonRepository.addFavoritePokemon(pokemon.id ?? '');
      fetchFavorites();
    } catch (e) {
      addError(e);
    }
  }
}
