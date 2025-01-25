import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';

class ImgPokemonWithType extends StatelessWidget {
  const ImgPokemonWithType({
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
              // child: ImgType(
              //   typeImg: mappingType(pokemon.typeofpokemon?[0] ?? ''),
              //   width: widthType,
              //   colorGradient: [
              //     mappingColors(pokemon.typeofpokemon?[0] ?? ''),
              //     Colors.black45,
              //   ],
              // ),
            ),
          ),
        Center(
          child: AnimatedOpacity(
            opacity: 1,
            duration: Duration(milliseconds: 1000),
            child: ImgPokemonShadow(
              pokemon: pokemon,
            ),
          ),
        ),
      ],
    );
  }
}
