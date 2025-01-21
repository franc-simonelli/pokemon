import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';
import 'package:pokedex/shared/widget/image_shadow.dart';

class ImagePokemon extends StatelessWidget {
  const ImagePokemon({
    required this.pokemon,
    this.widthType = 180,
    this.widthImage = 150,
    this.showType = false,
    this.opacity = 1,
    super.key,
  });

  final PokemonModel pokemon;
  final double widthType;
  final double widthImage;
  final bool showType;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showType)
          Center(
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                mappingType(pokemon.typeofpokemon?[0] ?? ''),
                fit: BoxFit.contain,
                width: widthType,
              ),
            ),
          ),
        Center(
          child: AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 1000),
            child: ImageShadow(
              pokemon: pokemon,
            ),
          ),
        ),
      ],
    );
  }
}
