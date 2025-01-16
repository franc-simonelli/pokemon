import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';

class ImagePokemon extends StatelessWidget {
  const ImagePokemon({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Opacity(
            opacity: 0.3,
            child: Image.asset(
              mappingType(pokemon.typeofpokemon?[0]),
              fit: BoxFit.contain,
              width: 190,
            ),
          ),
        ),
        Center(
          child: Image.network(
            pokemon.imageurl ?? '',
            width: 150,
          ),
        ),
      ],
    );
  }
}
