import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/card_pokemon.dart';

class GridPokemonWidget extends StatelessWidget {
  const GridPokemonWidget({
    required this.pokemonList,
    super.key,
  });

  final List<PokemonModel> pokemonList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.3,
      ),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return CardItem(pokemon: pokemonList[index]);
      },
    );
  }
}
