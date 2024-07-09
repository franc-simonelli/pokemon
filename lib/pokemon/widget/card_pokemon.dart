import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/image_shadow.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mappingColors(pokemon.typeofpokemon![0]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 5,
            child: MyText.labelSmall(
              context: context,
              // text: 'N° 004',
              text: pokemon.id ?? '',
            ),
          ),
          Positioned(
            top: 35,
            left: 5,
            child: MyText.labelLarge(
              context: context,
              // text: 'Charmander',
              text: pokemon.name ?? '',
              isFontBold: true,
            ),
          ),
          Positioned(
            top: 20,
            right: -20,
            child: ImageType(
              typeImg: pokemon.typeofpokemon![0],
            ),
          ),
          Positioned(
            top: 55,
            right: 5,
            child: SizedBox(
              height: 70,
              width: 70,
              child: ImageShadow(
                image: pokemon.imageurl ?? '',
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...pokemon.typeofpokemon!.mapIndexed(
                  (index, element) => Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: InfoSection(
                      pokemon: pokemon,
                      element: element,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
