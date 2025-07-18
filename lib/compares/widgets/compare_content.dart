// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/utils/generate_ticks.dart';
import 'package:pokedex/compares/widgets/compare_table.dart';
import 'package:pokedex/components/section_level.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/page_view_pokemon_list.dart';
import 'package:pokedex/pokemon/widget/single_stat_pokemon.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';

class CompareContent extends StatefulWidget {
  const CompareContent({
    required this.controller1,
    required this.controller2,
    required this.firstStatsCubit,
    required this.secondStatsCubit,
    this.initialPokemon,
    super.key,
  });

  final PageController controller1;
  final PageController controller2;
  final StatsPokemonCubit firstStatsCubit;
  final StatsPokemonCubit secondStatsCubit;
  final PokemonModel? initialPokemon;

  @override
  State<CompareContent> createState() => _CompareContentState();
}

class _CompareContentState extends State<CompareContent> {
  bool isStarted = false;
  @override
  void initState() {
    super.initState();
  }

  void _goToNextPageFirstList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = widget.controller1.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      widget.controller1.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeFirstPokemon(pokemonList[widget.controller1.page!.toInt() + 1]);
  }

  void _goToNextPageSecondList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = widget.controller2.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      widget.controller2.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeSecondPokemon(pokemonList[widget.controller2.page!.toInt() + 1]);
  }

  void _goToPreviousPageFirstList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = widget.controller1.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      widget.controller1.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeFirstPokemon(pokemonList[widget.controller1.page!.toInt() - 1]);
  }

  void _goToPreviousPageSecondList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = widget.controller2.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      widget.controller2.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeSecondPokemon(pokemonList[widget.controller2.page!.toInt() - 1]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ComparesCubit, ComparesState>(
      builder: (context, state) {
        if (state.pokemons.isNotEmpty) {
          return SliverList(
            delegate: SliverChildListDelegate(
              [
                // SizedBox(height: 20),
                _pokemonsSection(state, context),
                SizedBox(height: 20),
                _buildTable(state),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildStats(state),
                    ),
                    Expanded(
                      child: _buildGraphic(state),
                    ),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          );
        }
        return SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildTable(ComparesState state) {
    return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
      bloc: widget.firstStatsCubit,
      builder: (context, stateFirst) {
        return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
          bloc: widget.secondStatsCubit,
          builder: (context, stateSecond) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [],
                ),
                child: CompareTable(
                  firstName: state.firstPokemonSelected?.name ?? '',
                  secondName: state.secondPokemonSelected?.name ?? '',
                  firstStats: stateFirst.stats,
                  secondStats: stateSecond.stats,
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _pokemonsSection(ComparesState state, BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
                bloc: widget.firstStatsCubit,
                builder: (context, stateFirstPokemonStats) {
                  return _buildFirstPokemon(
                    compareState: state,
                    firstPokemonStatsState: stateFirstPokemonStats,
                    context: context,
                  );
                },
              ),
              SizedBox(width: 20),
              BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
                builder: (context, stateSecondPokemonStats) {
                  return _buildSecondPokemon(
                    compareState: state,
                    secondPokemonStatsState: stateSecondPokemonStats,
                    context: context,
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGraphic(ComparesState state) {
    return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
      bloc: widget.firstStatsCubit,
      builder: (context, stateFirst) {
        return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
          bloc: widget.secondStatsCubit,
          builder: (context, stateSecond) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [],
              ),
              padding: EdgeInsets.all(10),
              width: 200,
              height: 200,
              child: RadarChart(
                outlineColor: Colors.grey.shade300,
                sides: 6,
                featuresTextStyle: TextStyle(
                  color: Colors.blue.shade300,
                  fontSize: 16,
                ),
                graphColors: [
                  Colors.blue,
                  Color.fromARGB(255, 238, 106, 50),
                ],
                ticksTextStyle: TextStyle(
                  color: Colors.transparent,
                  fontSize: 10,
                ),
                ticks: generateTicks([
                  stateFirst.stats?.hp ?? 0,
                  stateFirst.stats?.attack ?? 0,
                  stateFirst.stats?.defense ?? 0,
                  stateFirst.stats?.specialAttack ?? 0,
                  stateFirst.stats?.specialDefense ?? 0,
                  stateFirst.stats?.speed ?? 0,
                  stateSecond.stats?.hp ?? 0,
                  stateSecond.stats?.attack ?? 0,
                  stateSecond.stats?.defense ?? 0,
                  stateSecond.stats?.specialAttack ?? 0,
                  stateSecond.stats?.specialDefense ?? 0,
                  stateSecond.stats?.speed ?? 0,
                ]),
                features: [
                  "Hp",
                  "Att",
                  "Def",
                  "S.Atk",
                  "S.Def",
                  "Spe",
                ],
                data: [
                  [
                    stateFirst.stats?.hp ?? 0,
                    stateFirst.stats?.attack ?? 0,
                    stateFirst.stats?.defense ?? 0,
                    stateFirst.stats?.specialAttack ?? 0,
                    stateFirst.stats?.specialDefense ?? 0,
                    stateFirst.stats?.speed ?? 0,
                  ],
                  [
                    stateSecond.stats?.hp ?? 0,
                    stateSecond.stats?.attack ?? 0,
                    stateSecond.stats?.defense ?? 0,
                    stateSecond.stats?.specialAttack ?? 0,
                    stateSecond.stats?.specialDefense ?? 0,
                    stateSecond.stats?.speed ?? 0,
                  ],
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildStats(ComparesState state) {
    return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
      bloc: widget.firstStatsCubit,
      builder: (context, stateFirst) {
        return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
            bloc: widget.secondStatsCubit,
            builder: (context, stateSecond) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [],
                  ),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Hp',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.hp.toString()
                            : '0',
                        color: Colors.green,
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.hp.toString()
                            : '0',
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Att',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.attack.toString()
                            : '0',
                        color: Colors.orange,
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.attack.toString()
                            : '0',
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Def',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.defense.toString()
                            : '0',
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.defense.toString()
                            : '0',
                        color: Colors.red,
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Sp.A',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.specialAttack.toString()
                            : '0',
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.specialAttack.toString()
                            : '0',
                        color: Colors.blue,
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Sp.D',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.specialDefense.toString()
                            : '0',
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.specialDefense.toString()
                            : '0',
                        color: Colors.blueGrey,
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Spe',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.speed.toString()
                            : '0',
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.speed.toString()
                            : '0',
                        color: Colors.purple,
                      ),
                      SizedBox(height: 5),
                      SinglStatPokemon(
                        onlyGraphic: true,
                        stats: 'Tot',
                        value: stateFirst.stats != null
                            ? stateFirst.stats!.total.toString()
                            : '0',
                        valueCompare: stateSecond.stats != null
                            ? stateSecond.stats!.total.toString()
                            : '0',
                        widthMax: 720,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }

  Widget _buildSecondPokemon({
    required ComparesState compareState,
    required StatsPokemonState secondPokemonStatsState,
    required BuildContext context,
  }) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText.labelMedium(
                context: context,
                text: compareState.secondPokemonSelected?.name ?? '',
                isFontBold: true,
                // color: const Color.fromARGB(255, 238, 106, 50),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () async {
                  PokemonModel? pokemon = await context
                      .push(ScreenPaths.searchPokemon, extra: true);
                  final index = compareState.pokemons.indexWhere(
                    (element) {
                      return element.id == pokemon?.id;
                    },
                  );
                  if (pokemon != null) {
                    widget.controller2.jumpToPage(index);
                  }
                },
                child: Icon(Icons.search_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  mappingColors(
                    secondPokemonStatsState.pokemon!.typeofpokemon![0],
                  ),
                  Colors.transparent,
                ],
              ),
            ),
            height: 90,
            child: PageViewPokemonList(
              activeClickImg: true,
              onlyPokemonImg: false,
              controller: widget.controller2,
              list: compareState.pokemons,
              showBack: compareState.pokemons.isNotEmpty &&
                  !compareState.secondListFirstPokemon,
              showForward: compareState.pokemons.isNotEmpty &&
                  !compareState.secondListLastPokemon,
              change: context.read<ComparesCubit>().changeSecondPokemon,
              onBack: () {
                _goToPreviousPageSecondList(
                  context,
                  compareState.pokemons,
                );
              },
              onForward: () {
                _goToNextPageSecondList(
                  context,
                  compareState.pokemons,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SectionLevel(
            initialLevel: secondPokemonStatsState.level,
            showLvSection: secondPokemonStatsState.showLvSlider,
            changeLevel: widget.secondStatsCubit.manageStatsByLv,
            onShowLvSelection: widget.secondStatsCubit.showLvSlider,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstPokemon({
    required ComparesState compareState,
    required StatsPokemonState firstPokemonStatsState,
    required BuildContext context,
  }) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText.labelMedium(
                context: context,
                text: compareState.firstPokemonSelected?.name ?? '',
                isFontBold: true,
                // color: Colors.blue,
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () async {
                  PokemonModel? pokemon = await context
                      .push(ScreenPaths.searchPokemon, extra: true);
                  final index = compareState.pokemons.indexWhere(
                    (element) {
                      return element.id == pokemon?.id;
                    },
                  );
                  if (pokemon != null) {
                    widget.controller1.jumpToPage(index);
                  }
                },
                child: Icon(Icons.search_outlined),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  mappingColors(
                    firstPokemonStatsState.pokemon!.typeofpokemon![0],
                  ),
                  Colors.transparent,
                ],
              ),
            ),
            height: 90,
            child: PageViewPokemonList(
              onlyPokemonImg: false,
              activeClickImg: true,
              controller: widget.controller1,
              list: compareState.pokemons,
              showBack: compareState.pokemons.isNotEmpty &&
                  !compareState.firstListFirstPokemon,
              showForward: compareState.pokemons.isNotEmpty &&
                  !compareState.firstListLastPokemon,
              change: context.read<ComparesCubit>().changeFirstPokemon,
              onBack: () {
                _goToPreviousPageFirstList(
                  context,
                  compareState.pokemons,
                );
              },
              onForward: () {
                _goToNextPageFirstList(
                  context,
                  compareState.pokemons,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SectionLevel(
            initialLevel: firstPokemonStatsState.level,
            showLvSection: firstPokemonStatsState.showLvSlider,
            changeLevel: widget.firstStatsCubit.manageStatsByLv,
            onShowLvSelection: widget.firstStatsCubit.showLvSlider,
          ),
        ],
      ),
    );
  }
}

class RadarChartSampleData {
  final String axis;
  final double value;

  RadarChartSampleData(this.axis, this.value);
}
