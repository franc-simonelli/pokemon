import 'package:flutter/material.dart';
import 'package:pokedex/features/home/widget/filter_section.dart';
import 'package:pokedex/features/home/widget/search_bar_widget.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final PagingController<int, PokemonModel> _pagingController =
  //     PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    // _pagingController.addPageRequestListener((pageKey) {
    //   context.read<PokemonCubit>().fetchPage(pageKey);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: true,
            expandedHeight: 110.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Align(
                  alignment: Alignment.center,
                  child: SearchBarWidget(),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(70.0),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: FilterSection(),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocConsumer<PokemonCubit, PokemonState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return GridPokemonWidget(pokemonList: state.filterPokemon);
                  },
                )
              ],
            ),
          ),
        ],
      ),
      // body: BlocConsumer<PokemonCubit, PokemonState>(
      //   listener: (context, state) {
      //     // if (state.statusPagination == Status.success) {
      //     //   if (state.isLastPage!) {
      //     //     // setState(() {
      //     //     _pagingController.appendLastPage(state.filterPokemon);
      //     //     // });
      //     //   } else {
      //     //     // setState(() {
      //     //     _pagingController.appendPage(
      //     //         state.filterPokemon, state.nextPageKey);
      //     //     // });
      //     //   }
      //     // } else if (state.statusPagination == Status.error) {
      //     //   _pagingController.error = 'Errore';
      //     // }
      //   },
      //   builder: (context, state) {
      //     // return PagedListView<int, PokemonModel>(
      //     //   pagingController: _pagingController,
      //     //   shrinkWrap: true,
      //     //   builderDelegate: PagedChildBuilderDelegate<PokemonModel>(
      //     //     itemBuilder: (context, item, index) => Container(
      //     //       // color: Colors.red,
      //     //       child: ListTile(
      //     //         title: Text('${index + 1} - ${item.name}'),
      //     //       ),
      //     //     ),
      //     //   ),
      //     // );
      //     return GridPokemonWidget(pokemonList: state.allPokemons);
      //   },
      // ),
    );
  }
}
