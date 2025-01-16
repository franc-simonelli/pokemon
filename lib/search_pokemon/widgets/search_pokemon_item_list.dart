import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/shared/widget/image_shadow.dart';
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
            child: ImageShadow(
              pokemon: pokemon,
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
                child: GestureDetector(
                  onTap: () {
                    pressDelete!(pokemon);
                  },
                  child: Icon(Icons.close),
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
