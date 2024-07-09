import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon/widget/info_type_section.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Info type section',
  type: InfoSection,
)
Widget cardPokemon(BuildContext context) {
  return Center(
    child: TypeInfoSection(
      type: context.knobs.list(
        label: 'Type',
        options: ['Fire', 'Water', 'Grass'],
        initialOption: 'Fire',
      ),
    ),
  );
}
