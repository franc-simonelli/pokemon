import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/components/widgets/img_type.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/damage_relations.dart';
import 'package:pokedex/pokemon/widget/single_stat_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/pokemon_detail/widgets/header_section.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
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
    return BlocProvider.value(
      value: _pokemonDetailCubit,
      child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(context, state.pokemonSelected),
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: -110,
                  child: Opacity(
                    opacity: 1,
                    child: ImgType(
                      width: 450,
                      typeImg: state.pokemonSelected.typeofpokemon![0],
                      boxFit: BoxFit.contain,
                      colorGradient: [
                        Colors.black87,
                        Colors.black54,
                        mappingColors(
                          state.pokemonSelected.typeofpokemon![0],
                        ),
                        Colors.black54,
                        mappingColors(
                          state.pokemonSelected.typeofpokemon![0],
                        ),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: HeaderSection(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _buildButtonMovesEvo(context, state),
                          ],
                        ),
                        _buildDescription(context, state.pokemonSelected),
                        SizedBox(height: 30),
                        BlocProvider.value(
                          value: _statsPokemonCubit,
                          child: StatsPokemon(),
                        ),
                        // _buildStats(),
                        SizedBox(height: 30),
                        DamageRelations(
                          immunity: state.pokemonSelected.immunity ?? [],
                          isLoading: state.pokemonSelected.infoUpdate ?? false,
                          weaknesses: state.pokemonSelected.weaknesses ?? [],
                          resistence: state.pokemonSelected.resistence ?? [],
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildButtonMovesEvo(BuildContext context, PokemonDetailState state) {
    return ButtonScaled(
      child: Row(
        children: [
          MyText.labelMedium(
            context: context,
            text: 'Moves/Evo',
            isFontBold: true,
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      ),
      onPress: () {
        context.push(
          ScreenPaths.otherInformationPokemon,
          extra: state.pokemonSelected,
        );
      },
    );
  }

  Widget _buildDescription(BuildContext context, PokemonModel pokemon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: MyText.labelMedium(
          context: context,
          text: pokemon.xdescription ?? '',
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, PokemonModel pokemon) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          MyText.labelLarge(
            context: context,
            text: pokemon.name ?? '',
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: () {},
            child: Icon(Icons.favorite_border_outlined),
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

  Widget _buildStats() {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        final infoUpdate = state.pokemonSelected.infoUpdate ?? false;
        // final stats = state.manageStats;
        return Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                SinglStatPokemon(
                  stats: 'Hp',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.hp.toString()
                      : '0',
                  color: Colors.green,
                ),
                SinglStatPokemon(
                  stats: 'Attack',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.attack.toString()
                      : '0',
                  color: Colors.orange,
                ),
                SinglStatPokemon(
                  stats: 'Defense',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.defense.toString()
                      : '0',
                  color: Colors.red,
                ),
                SinglStatPokemon(
                  stats: 'Sp. Atk',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.specialAttack.toString()
                      : '0',
                  color: Colors.blue,
                ),
                SinglStatPokemon(
                  stats: 'Sp. Def',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.specialDefense.toString()
                      : '0',
                  color: Colors.blueGrey,
                ),
                SinglStatPokemon(
                  stats: 'Speed',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.speed.toString()
                      : '0',
                  color: Colors.purple,
                ),
                SinglStatPokemon(
                  stats: 'Total',
                  value: infoUpdate && state.manageStats != null
                      ? state.manageStats!.total.toString()
                      : '0',
                  widthMax: 720,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// class StatsPokemon extends StatefulWidget {
//   const StatsPokemon({super.key});

//   @override
//   State<StatsPokemon> createState() => _StatsPokemonState();
// }

// class _StatsPokemonState extends State<StatsPokemon> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
