import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/utils/generate_ticks.dart';
import 'package:pokedex/compares/widgets/table_stats.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/components/widgets/img_type.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/page_view_pokemon_list.dart';
import 'package:pokedex/pokemon/widget/stats_pokemon.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';

class CompareContent extends StatefulWidget {
  const CompareContent({
    required this.controller1,
    required this.controller2,
    this.initialPokemon,
    super.key,
  });

  final PageController controller1;
  final PageController controller2;
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
      // listenWhen: (previous, current) {
      //   return current.initialPokemon != null;
      // },
      // listener: (context, state) {
      //   PokemonModel? initialPokemon = state.initialPokemon;
      //   final pokemons = state.pokemons.toList();
      //   final index = pokemons.indexWhere(
      //     (element) {
      //       return element.id == initialPokemon?.id;
      //     },
      //   );
      //   if (initialPokemon != null) {
      //     widget.controller1.jumpToPage(index);
      //   }
      // },
      builder: (context, state) {
        if (state.pokemons.isNotEmpty) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _pokemonsSection(state, context),
                Column(
                  children: [
                    _buildTable(state),
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                  ],
                )
              ],
            ),
          );
        }
        return Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _buildTable(ComparesState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TableStats(
        firstName: state.firstPokemonSelected?.name ?? '',
        secondName: state.secondPokemonSelected?.name ?? '',
        statsFirst: [
          state.firstPokemonSelected?.hp ?? 0,
          state.firstPokemonSelected?.attack ?? 0,
          state.firstPokemonSelected?.defense ?? 0,
          state.firstPokemonSelected?.specialAttack ?? 0,
          state.firstPokemonSelected?.specialDefense ?? 0,
          state.firstPokemonSelected?.speed ?? 0,
          state.firstPokemonSelected?.total ?? 0,
        ],
        statsSecond: [
          state.secondPokemonSelected?.hp ?? 0,
          state.secondPokemonSelected?.attack ?? 0,
          state.secondPokemonSelected?.defense ?? 0,
          state.secondPokemonSelected?.specialAttack ?? 0,
          state.secondPokemonSelected?.specialDefense ?? 0,
          state.secondPokemonSelected?.speed ?? 0,
          state.secondPokemonSelected?.total ?? 0,
        ],
      ),
    );
  }

  Widget _pokemonsSection(ComparesState state, BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              _buildFirstList(state, context),
              _buildSecondList(state, context),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  Widget _buildGraphic(ComparesState state) {
    final ticks = generateTicks([
      state.firstPokemonSelected?.hp ?? 0,
      state.firstPokemonSelected?.attack ?? 0,
      state.firstPokemonSelected?.defense ?? 0,
      state.firstPokemonSelected?.specialAttack ?? 0,
      state.firstPokemonSelected?.specialDefense ?? 0,
      state.firstPokemonSelected?.speed ?? 0,
      state.secondPokemonSelected?.hp ?? 0,
      state.secondPokemonSelected?.attack ?? 0,
      state.secondPokemonSelected?.defense ?? 0,
      state.secondPokemonSelected?.specialAttack ?? 0,
      state.secondPokemonSelected?.specialDefense ?? 0,
      state.secondPokemonSelected?.speed ?? 0,
    ]);
    return SizedBox(
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
          Colors.red,
        ],
        ticksTextStyle: TextStyle(
          color: Colors.transparent,
          fontSize: 10,
        ),
        ticks: ticks,
        features: [
          "HP",
          "Att",
          "Def",
          "S.Atk",
          "S.Def",
          "Spe",
        ],
        data: [
          [
            state.firstPokemonSelected?.hp ?? 0,
            state.firstPokemonSelected?.attack ?? 0,
            state.firstPokemonSelected?.defense ?? 0,
            state.firstPokemonSelected?.specialAttack ?? 0,
            state.firstPokemonSelected?.specialDefense ?? 0,
            state.firstPokemonSelected?.speed ?? 0,
          ],
          [
            state.secondPokemonSelected?.hp ?? 0,
            state.secondPokemonSelected?.attack ?? 0,
            state.secondPokemonSelected?.defense ?? 0,
            state.secondPokemonSelected?.specialAttack ?? 0,
            state.secondPokemonSelected?.specialDefense ?? 0,
            state.secondPokemonSelected?.speed ?? 0,
          ],
        ],
      ),
    );
  }

  Widget _buildStats(ComparesState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Hp',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.hp.toString()
                : '0',
            color: Colors.green,
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.hp.toString()
                : '0',
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Att',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.attack.toString()
                : '0',
            color: Colors.orange,
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.attack.toString()
                : '0',
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Def',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.defense.toString()
                : '0',
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.defense.toString()
                : '0',
            color: Colors.red,
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Sp.A',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.specialAttack.toString()
                : '0',
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.specialAttack.toString()
                : '0',
            color: Colors.blue,
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Sp.D',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.specialDefense.toString()
                : '0',
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.specialDefense.toString()
                : '0',
            color: Colors.blueGrey,
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Spe',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.speed.toString()
                : '0',
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.speed.toString()
                : '0',
            color: Colors.purple,
          ),
          SizedBox(height: 5),
          StatsPokemon(
            onlyGraphic: true,
            stats: 'Tot',
            value: state.firstPokemonSelected?.statsUpdate != null &&
                    state.firstPokemonSelected!.statsUpdate!
                ? state.firstPokemonSelected!.total.toString()
                : '0',
            valueCompare: state.secondPokemonSelected?.statsUpdate != null &&
                    state.secondPokemonSelected!.statsUpdate!
                ? state.secondPokemonSelected!.total.toString()
                : '0',
            widthMax: 720,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _buildSecondList(ComparesState state, BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: PageViewPokemonList(
              activeClickImg: true,
              onlyPokemonImg: false,
              controller: widget.controller2,
              list: state.pokemons,
              showBack:
                  state.pokemons.isNotEmpty && !state.secondListFirstPokemon,
              showForward:
                  state.pokemons.isNotEmpty && !state.secondListLastPokemon,
              change: context.read<ComparesCubit>().changeSecondPokemon,
              onBack: () {
                _goToPreviousPageSecondList(
                  context,
                  state.pokemons,
                );
              },
              onForward: () {
                _goToNextPageSecondList(
                  context,
                  state.pokemons,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          _buildName(
            context: context,
            pokemon: state.secondPokemonSelected!,
            pokemons: state.pokemons.toList(),
            isFirstPokemon: false,
          ),
        ],
      ),
    );
  }

  Widget _buildFirstList(ComparesState state, BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: PageViewPokemonList(
              onlyPokemonImg: false,
              activeClickImg: true,
              controller: widget.controller1,
              list: state.pokemons,
              showBack:
                  state.pokemons.isNotEmpty && !state.firstListFirstPokemon,
              showForward:
                  state.pokemons.isNotEmpty && !state.firstListLastPokemon,
              change: context.read<ComparesCubit>().changeFirstPokemon,
              onBack: () {
                _goToPreviousPageFirstList(
                  context,
                  state.pokemons,
                );
              },
              onForward: () {
                _goToNextPageFirstList(
                  context,
                  state.pokemons,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          _buildName(
            context: context,
            pokemon: state.firstPokemonSelected!,
            pokemons: state.pokemons.toList(),
            isFirstPokemon: true,
          ),
        ],
      ),
    );
  }

  Widget _buildName({
    required BuildContext context,
    required List<PokemonModel> pokemons,
    required PokemonModel pokemon,
    required bool isFirstPokemon,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ImgType(
          typeImg: pokemon.typeofpokemon?[0] ?? '',
          width: 20,
          colorGradient: [
            mappingColors(
              pokemon.typeofpokemon?[0] ?? '',
            ),
            Colors.black,
          ],
        ),
        SizedBox(width: 10),
        MyText.labelMedium(
          context: context,
          text: pokemon.name ?? '',
          isFontBold: true,
        ),
        IconButton(
          icon: Icon(
            Icons.search_outlined,
            color: isFirstPokemon ? Colors.blue : Colors.red,
          ),
          onPressed: () async {
            PokemonModel? pokemon =
                await context.push(ScreenPaths.searchPokemon, extra: true);
            final index = pokemons.indexWhere(
              (element) {
                return element.id == pokemon?.id;
              },
            );
            if (pokemon != null) {
              if (isFirstPokemon) {
                widget.controller1.jumpToPage(index);
              } else {
                widget.controller2.jumpToPage(index);
              }
            }
          },
        )
      ],
    );
  }
}
