import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';
import 'package:pokedex/search_pokemon/widgets/pkm_input_search_bar.dart';
import 'package:pokedex/search_pokemon/widgets/search_pokemon_list.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';
import 'package:pokedex/theme/app_colors.dart';

class SearchPokemonContent extends StatelessWidget {
  const SearchPokemonContent({
    this.searchCompare = false,
    super.key,
  });

  final bool searchCompare;

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return BlocBuilder<SearchPokemonCubit, SearchPokemonState>(
      builder: (context, state) {
        return PkmScaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            title: PkmInputSearchBar(),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: appBarHeight + safeAreaHeight),
                if (state.pokemons.isNotEmpty)
                  SearchPokemonsList(
                    pokemons: state.pokemons,
                    pressItem: (value) {
                      context
                          .read<SearchPokemonCubit>()
                          .manageChronology(value);

                      if (searchCompare) {
                        context.pop(value);
                      } else {
                        context.push(ScreenPaths.detailPokemon, extra: {
                          'pokemonSelected': value,
                          'gen': EnumGen.all,
                        });
                      }
                    },
                  ),
                if (state.pokemons.isEmpty && state.chronology.isNotEmpty) ...[
                  SizedBox(height: 20),
                  MyText.labelSmall(
                    context: context,
                    text: 'Cronologia',
                    color: AppColors.lightGrey,
                  ),
                  SearchPokemonsList(
                    pokemons: state.chronology,
                    showDelete: true,
                    pressDelete:
                        context.read<SearchPokemonCubit>().deleteItemChronology,
                    pressItem: (value) {
                      if (searchCompare) {
                        context.pop(value);
                      } else {
                        context
                            .read<SearchPokemonCubit>()
                            .manageChronology(value);
                        context.push(ScreenPaths.detailPokemon, extra: {
                          'pokemonSelected': value,
                          'gen': EnumGen.all,
                        });
                      }
                    },
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
