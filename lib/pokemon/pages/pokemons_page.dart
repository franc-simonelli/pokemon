import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/filters/widgets/all_type_widget.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_search_bar.dart';

class PokemonsPage extends StatefulWidget {
  const PokemonsPage({
    required this.gen,
    this.scrollController,
    super.key,
  });

  final EnumGen gen;
  final ScrollController? scrollController;

  @override
  State<PokemonsPage> createState() => _PokemonsPageState();
}

class _PokemonsPageState extends State<PokemonsPage> {
  bool _showScrollToTopButton = false;
  final double _scrollThreshold = 1500.0;

  @override
  void initState() {
    super.initState();

    widget.scrollController?.addListener(() {
      if (widget.scrollController!.position.pixels > _scrollThreshold) {
        if (!_showScrollToTopButton) {
          setState(() {
            _showScrollToTopButton = true;
          });
        }
      } else {
        if (_showScrollToTopButton) {
          setState(() {
            _showScrollToTopButton = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      child: Stack(
        children: [
          CustomScrollView(
            controller: widget.scrollController,
            physics: const ScrollPhysics(
              parent: BouncingScrollPhysics(),
            ),
            slivers: [
              _buildSliverAppBar(context),
              _buildSliverGrid(),
            ],
          ),
          if (_showScrollToTopButton) _buildIconScrollTop()
        ],
      ),
    );
  }

  Widget _buildIconScrollTop() {
    return Positioned(
      top: 80,
      right: 0,
      child: GestureDetector(
        onTap: () {
          widget.scrollController?.position.animateTo(
            0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
          );
        },
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black,
            border: Border.all(
              color: Colors.white,
            ),
          ),
          child: Center(
            child: Icon(Icons.arrow_upward),
          ),
        ),
      ),
    );
  }

  Widget _buildSliverGrid() {
    return BlocConsumer<PokemonCubit, PokemonState>(
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
          padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
            bottom: 50,
          ),
          sliver: GridPokemonWidget(
            pokemonList: state.listPokemons,
            gen: EnumGen.all,
          ),
        );
      },
    );
  }

  Widget _buildSliverAppBar(BuildContext context) {
    final isFirstPage = Navigator.of(context).widget.pages.length == 1;
    return SliverAppBar(
      surfaceTintColor: Colors.black,
      backgroundColor: Colors.transparent,
      pinned: false,
      floating: false,
      automaticallyImplyLeading: false,
      expandedHeight: 90.0,
      leading: const SizedBox.shrink(),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 10, 16, 30),
            child: Column(
              children: [
                _buildAppBar(isFirstPage, context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(bool isFirstPage, BuildContext context) {
    return SizedBox(
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
            child: PkmSearchBar(),
          ),
          // if (isFirstPage) ...[
          SizedBox(width: 20),
          GestureDetector(
            onTap: () async {
              final filtersCubit = context.read<FiltersCubit>();
              await showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: AllTypeModalWidget(
                    filtersCubit: filtersCubit,
                  ),
                ),
              );
            },
            child: Icon(
              Icons.tune,
              color: Colors.grey.shade200,
            ),
          ),
          // ],
        ],
      ),
    );
  }
}
