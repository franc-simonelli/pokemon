import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/info_type_section.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.pokemon,
    required this.element,
  });

  final PokemonModel pokemon;
  final String element;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black45,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 5,
          right: 10,
          top: 5,
          bottom: 5,
        ),
        child: Row(
          children: [
            TypeInfoSection(type: element),
            const SizedBox(width: 8),
            Text(
              element,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
