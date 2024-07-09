import 'package:flutter/material.dart';
import 'package:pokedex/core/data/pokemon_list.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Info section',
  type: InfoSection,
)
Widget cardPokemon(BuildContext context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InfoSection(
          pokemon: dataList[0],
          element: dataList[0].typeofpokemon![0],
        ),
      ],
    ),
  );
}
