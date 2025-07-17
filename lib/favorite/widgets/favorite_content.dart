import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/dismissible_card.dart';
import 'package:pokedex/favorite/cubit/favorites_cubit.dart';
import 'package:pokedex/favorite/widgets/card_favorite.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        return SliverList.builder(
          itemCount: state.pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = state.pokemons[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildCard(pokemon, context),
            );
          },
        );
      },
    );
  }

  Widget _buildCard(PokemonModel pokemon, BuildContext context) {
    return DismissibleCard(
      pokemon: pokemon,
      onDismissed: (pokemon) {
        context.read<FavoritesCubit>().removeFavoritePokemon(pokemon);
      },
      child: CardFavorite(pokemon: pokemon),
    );
  }
}
