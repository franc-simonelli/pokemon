import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';
import 'package:pokedex/search_pokemon/widgets/search_pokemon_item_list.dart';

class SearchPokemonsList extends StatelessWidget {
  const SearchPokemonsList({
    required this.pokemons,
    this.showDelete,
    this.pressDelete,
    super.key,
  });

  final List<PokemonModel> pokemons;
  final bool? showDelete;
  final Function? pressDelete;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: GestureDetector(
              onTap: () {
                context.read<SearchPokemonCubit>().manageChronology(pokemon);
                context.push(ScreenPaths.detailPokemon, extra: {
                  'pokemonSelected': pokemon,
                  'gen': EnumGen.all,
                });
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
