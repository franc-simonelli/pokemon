import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';
import 'package:pokedex/search_pokemon/widgets/search_bar.dart';
import 'package:pokedex/search_pokemon/widgets/search_pokemon_list.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class SearchPokemonContent extends StatelessWidget {
  const SearchPokemonContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchPokemonCubit, SearchPokemonState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            title: SearchBarPokemon(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                if (state.pokemons.isNotEmpty)
                  SearchPokemonsList(
                    pokemons: state.pokemons,
                  ),
                if (state.pokemons.isEmpty && state.chronology.isNotEmpty) ...[
                  MyText.labelSmall(context: context, text: 'Cronologia'),
                  SearchPokemonsList(
                    pokemons: state.chronology,
                    showDelete: true,
                    pressDelete:
                        context.read<SearchPokemonCubit>().deleteItemChronology,
                  ),
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
