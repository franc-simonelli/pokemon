// ignore_for_file: void_checks

import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/search_pokemon/widgets/search_pokemon_item_list.dart';

class SearchPokemonsList extends StatelessWidget {
  const SearchPokemonsList({
    required this.pokemons,
    required this.pressItem,
    this.showDelete,
    this.pressDelete,
    super.key,
  });

  final List<PokemonModel> pokemons;
  final bool? showDelete;
  final Function pressItem;
  final Function? pressDelete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                return pressItem(pokemon);
              },
              child: SearchPokemonItemList(
                pokemon: pokemon,
                showDelete: showDelete,
                pressDelete: pressDelete,
              ),
            ),
          );
        },
      ),
    );
  }
}
