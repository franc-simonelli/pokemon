import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class SearchPokemonItemList extends StatelessWidget {
  const SearchPokemonItemList({
    super.key,
    required this.pokemon,
    required this.showDelete,
    this.pressDelete,
  });

  final PokemonModel pokemon;
  final bool? showDelete;
  final Function? pressDelete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            width: 40,
            height: 40,
            // child: Image.network(
            //   'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif',
            // ),
            child: ImgPokemonShadow(
              pokemon: pokemon,
              imageGif:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: 7,
          child: MyText.labelMedium(
            context: context,
            text: pokemon.name ?? '',
          ),
        ),
        showDelete != null && showDelete!
            ? Expanded(
                flex: 1,
                child: IconButton(
                  onPressed: () {
                    pressDelete!(pokemon);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: Colors.grey,
                  ),
                ),
              )
            : Expanded(
                flex: 1,
                child: Container(),
              )
      ],
    );
  }
}
