import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/home/widget/filter_section.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class PokemonsPage extends StatelessWidget {
  const PokemonsPage({
    required this.gen,
    this.scrollController,
    super.key,
  });

  final EnumGen gen;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
          slivers: [
            _buildSliverAppBar(context),
            BlocConsumer<PokemonCubit, PokemonState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state.statusPagination == Status.loading &&
                    state.listPokemons.isEmpty) {
                  return SliverToBoxAdapter(
                    child: const Center(
                      child: CupertinoActivityIndicator(),
                    ),
                  );
                }
                if (state.statusPagination == Status.error) {
                  return SliverToBoxAdapter(
                    child: MyText.labelMedium(context: context, text: 'Errore'),
                  );
                }
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: GridPokemonWidget(
                    pokemonList: state.listPokemons,
                    gen: EnumGen.all,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final isFirstPage = Navigator.of(context).widget.pages.length == 1;
    return SliverAppBar(
      elevation: 0,
      pinned: false,
      floating: true,
      automaticallyImplyLeading: true,
      expandedHeight: 120.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 20, 16, 30),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 44,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (!isFirstPage) ...[
                        GestureDetector(
                          onTap: () {
                            context.pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.grey.shade400,
                          ),
                        ),
                        SizedBox(width: 20),
                      ],
                      Expanded(
                        child: _buildSearchBar(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 5),
          child: BlocBuilder<FiltersCubit, FiltersState>(
            builder: (context, state) {
              return FilterSection(
                typesSelect: state.typesSelect,
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;
    return GestureDetector(
      onTap: () {
        context.push(ScreenPaths.searchPokemon, extra: false);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              offset: const Offset(0, -1),
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
            )
          ],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.search,
                color: Colors.grey.shade400,
              ),
            ),
            Text(
              'Cerca un pokemon . . .',
              style: TextStyle(
                color: Colors.grey.shade400,
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            )
          ],
        ),
      ),
    );
  }
}
