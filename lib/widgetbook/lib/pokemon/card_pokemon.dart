import 'package:flutter/material.dart';
import 'package:pokedex/core/data/pokemon_list.dart';
import 'package:pokedex/pokemon/widget/card_pokemon.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Card pokemon',
  type: CardItem,
)
Widget cardPokemon(BuildContext context) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: AspectRatio(
        aspectRatio: 1.3,
        child: CardItem(
          pokemon: dataList[0],
        ),
      ),
    ),
  );
}
