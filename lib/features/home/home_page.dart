import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/features/home/widget/filter_section.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent - 0) {
        await _loadMoreData();
      }
    });
  }

  Future<void> _loadMoreData() async {
    context.read<PokemonCubit>().loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey.shade900,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          _buildSliverAppBar(),
          const SliverPadding(padding: EdgeInsets.only(bottom: 0)),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                BlocConsumer<PokemonCubit, PokemonState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state.statusPagination == Status.loading &&
                        state.listPokemons.isEmpty) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    if (state.statusPagination == Status.error) {
                      return MyText.labelMedium(
                          context: context, text: 'Errore');
                    }
                    return GridPokemonWidget(
                      pokemonList: state.listPokemons,
                      gen: EnumGen.all,
                    );
                  },
                ),
                BlocBuilder<PokemonCubit, PokemonState>(
                  builder: (context, state) {
                    if (state.statusPagination == Status.loading &&
                        state.listPokemons.isNotEmpty) {
                      return const Column(
                        children: [
                          SizedBox(height: 30),
                          CupertinoActivityIndicator(),
                          SizedBox(height: 30),
                        ],
                      );
                    }
                    return Container();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      // backgroundColor: Colors.black,
      pinned: true,
      floating: true,
      expandedHeight: 130.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
          child: Align(
            alignment: Alignment.center,
            child: _buildSearchBar(),
          ),
        ),
      ),
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: FilterSection(),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return GestureDetector(
      onTap: () {
        context.push(ScreenPaths.searchPokemon);
      },
      child: Container(
        height: 44,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade800,
              offset: const Offset(-1, -1),
            ),
            const BoxShadow(
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
                color: Colors.grey,
              ),
            ),
            MyText.labelMedium(context: context, text: 'Cerca')
          ],
        ),
      ),
    );
  }
}
