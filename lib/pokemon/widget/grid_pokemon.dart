import 'package:flutter/cupertino.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/card_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';

class GridPokemonWidget extends StatefulWidget {
  const GridPokemonWidget({
    required this.pokemonList,
    required this.gen,
    super.key,
  });

  final List<PokemonModel> pokemonList;
  final EnumGen gen;

  @override
  State<GridPokemonWidget> createState() => _GridPokemonWidgetState();
}

class _GridPokemonWidgetState extends State<GridPokemonWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 15,
        childAspectRatio: 1.3,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: widget.pokemonList.length,
        (context, index) => RepaintBoundary(
          child: CardItem(
            pokemon: widget.pokemonList[index],
            gen: widget.gen,
          ),
        ),
      ),
    );
  }
}
