import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/button_favorite.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/damage_relations.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/pokemon_detail/widgets/header_section.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';
import 'package:pokedex/shared/widget/wallpaper_type_pokemon.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/widgets/stats_pokemon.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    required this.pokemonSelected,
    required this.gen,
    super.key,
  });

  final PokemonModel pokemonSelected;
  final EnumGen gen;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonDetailCubit _pokemonDetailCubit;
  late StatsPokemonCubit _statsPokemonCubit;
  @override
  void initState() {
    final pokemonRepository = context.read<PokemonRepository>();
    _statsPokemonCubit = StatsPokemonCubit();
    _pokemonDetailCubit = PokemonDetailCubit(
      pokemonSelected: widget.pokemonSelected,
      gen: widget.gen,
      pokemonRepository: pokemonRepository,
      statsPokemonCubit: _statsPokemonCubit,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return BlocProvider.value(
      value: _pokemonDetailCubit,
      child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        builder: (context, state) {
          return PkmScaffold(
            appBar: _buildAppBar(context, state.pokemonSelected),
            body: Stack(
              children: [
                WallpaperTypePokemon(
                  type: state.pokemonSelected.typeofpokemon![0],
                ),
                Column(
                  children: [
                    SizedBox(height: appBarHeight + safeAreaHeight),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                child: HeaderSection(),
                              ),
                              SizedBox(height: 16),
                              _buildDescription(context, state.pokemonSelected),
                              SizedBox(height: 16),
                              BlocProvider.value(
                                value: _statsPokemonCubit,
                                child: StatsPokemon(),
                              ),
                              SizedBox(height: 20),
                              DamageRelations(
                                immunity: state.pokemonSelected.immunity ?? [],
                                isLoading:
                                    state.pokemonSelected.infoUpdate ?? false,
                                weaknesses:
                                    state.pokemonSelected.weaknesses ?? [],
                                resistence:
                                    state.pokemonSelected.resistence ?? [],
                              ),
                              SizedBox(height: 30),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDescription(BuildContext context, PokemonModel pokemon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: MyText.labelMedium(
          context: context,
          text: pokemon.xdescription ?? '',
          color: Colors.white,
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, PokemonModel pokemon) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: Row(
        children: [
          MyText.labelLarge(
            context: context,
            text: pokemon.name ?? '',
            isFontBold: true,
            isBorderText: true,
            fontSize: 22,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: ButtonFavorite(
            pokemon: pokemon,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: Icon(Icons.compare_arrows_outlined),
            onPressed: () {
              final list =
                  context.read<PokemonDetailCubit>().state.pokemonList.toList();
              final index = list.indexWhere(
                (element) {
                  return element.id == pokemon.id;
                },
              );
              context.push(ScreenPaths.compareInit, extra: index);
            },
          ),
        ),
      ],
    );
  }
}
