import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/route/go_router_config.dart';
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
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(-2, -2),
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
          )
        ],
        color: mappingColors(pokemon.typeofpokemon![0]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          // id
          Positioned(
            top: 15,
            left: 5,
            child: Stack(
              children: [
                MyText.labelSmall(
                  context: context,
                  isFontBold: true,
                  text: pokemon.id ?? '',
                  color: Colors.white,
                  isBorderText: true,
                ),
              ],
            ),
          ),
          // name
          Positioned(
            top: 35,
            left: 5,
            child: Stack(
              children: [
                MyText.labelLarge(
                  context: context,
                  text: pokemon.name ?? '',
                  isFontBold: true,
                  color: Colors.white,
                  isBorderText: true,
                ),
              ],
            ),
          ),
          // type image
          Positioned(
            top: 20,
            right: -20,
            child: ImageType(
              typeImg: pokemon.typeofpokemon![0],
            ),
          ),
          // image pokemon
          Positioned(
            top: 50,
            right: 0,
            child: SizedBox(
              height: 90,
              width: 90,
              // child: Image.network(
              //   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif',
              // ),

              child: ImageShadow(
                pokemon: pokemon,
                imageGif:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
              ),
            ),
          ),
          // list type
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
