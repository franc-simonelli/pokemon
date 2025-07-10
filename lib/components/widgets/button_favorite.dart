import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/icon_scaled.dart';
import 'package:pokedex/favorite/cubit/favorites_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

class ButtonFavorite extends StatelessWidget {
  const ButtonFavorite({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        final isFavorite = state.pokemons.any((p) => p.id == pokemon.id);
        return IconScaled(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
            color: isFavorite ? Colors.red : Colors.grey,
            shadows: [
              isFavorite
                  ? Shadow(
                      color: Colors.black,
                      offset: const Offset(0, 2),
                      blurRadius: 10,
                    )
                  : Shadow(
                      color: Colors.transparent,
                      offset: const Offset(0, 0),
                      blurRadius: 0,
                    ),
            ],
          ),
          onPress: () {
            context.read<FavoritesCubit>().addFavoritePokemon(pokemon);
          },
        );
      },
    );
  }
}
