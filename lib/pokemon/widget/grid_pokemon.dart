import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/card_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';

class GridPokemonWidget extends StatelessWidget {
  const GridPokemonWidget({
    required this.pokemonList,
    required this.gen,
    super.key,
  });

  final List<PokemonModel> pokemonList;
  final EnumGen gen;

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
        return GestureDetector(
          onTap: () {
            context.push(ScreenPaths.detailPokemon, extra: {
              'pokemonSelected': pokemonList[index],
              'gen': gen,
            });
          },
          child: CardItem(
            pokemon: pokemonList[index],
          ),
        );
      },
    );
  }
}
