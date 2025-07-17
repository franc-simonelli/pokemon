import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/favorite/favorite_page.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardFavorite extends StatelessWidget {
  const CardFavorite({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.transparent,
              mappingColors(pokemon.typeofpokemon![0]),
              Colors.black,
            ],
          ),
        ),
        child: _buildExpansionTile(pokemon, context),
      ),
    );
  }

  Widget _buildExpansionTile(PokemonModel pokemon, BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      shape: Border.fromBorderSide(BorderSide.none),
      collapsedShape: Border.fromBorderSide(BorderSide.none),
      clipBehavior: Clip.none,
      childrenPadding: EdgeInsets.symmetric(vertical: 10),
      tilePadding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              context.push(ScreenPaths.detailPokemon, extra: {
                'pokemonSelected': pokemon,
                'gen': EnumGen.all,
              });
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: ImgPokemonShadow(
                pokemon: pokemon,
                imageGif:
                    "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
              ),
            ),
          ),
          SizedBox(width: 16),
          MyText.labelMedium(
            context: context,
            text: pokemon.name ?? '',
            isFontBold: true,
          ),
        ],
      ),
      children: <Widget>[
        Builder(
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 10),
                  FavoriteCardSection(pokemon: pokemon),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
