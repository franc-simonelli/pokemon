import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/card_fade_animations.dart';
import 'package:pokedex/components/widgets/card_scaled.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/image_shadow.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.pokemon,
    this.gen = EnumGen.all,
  });

  final PokemonModel pokemon;
  final EnumGen gen;

  @override
  Widget build(BuildContext context) {
    return CardFadeTransition(
      child: CardScaled(
        onPress: () {
          context.push(ScreenPaths.detailPokemon, extra: {
            'pokemonSelected': pokemon,
            'gen': EnumGen.all,
          });
        },
        decorationCard: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              mappingColors(pokemon.typeofpokemon![0]),
              Colors.black38,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              offset: const Offset(0, 0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.grey.shade700,
              offset: const Offset(1, 0),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.black,
              offset: const Offset(0, 3),
              blurRadius: 1,
            ),
          ],
          color: mappingColors(pokemon.typeofpokemon![0]),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            // id
            Positioned(
              top: 5,
              right: 10,
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
              top: 25,
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
                child: ImageShadow(
                  pokemon: pokemon,
                  // imageGif: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
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
                      padding: const EdgeInsets.only(bottom: 0),
                      child: InfoSection(
                        element: element,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
