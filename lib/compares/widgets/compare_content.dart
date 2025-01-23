import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/pages/compare_page.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/stats_pokemon.dart';
import 'package:pokedex/search_pokemon/search_pokemon_page.dart';
import 'package:pokedex/search_pokemon/widgets/search_bar.dart';
import 'package:pokedex/shared/widget/content_modal_widget.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CompareContent extends StatefulWidget {
  const CompareContent({super.key});

  @override
  State<CompareContent> createState() => _CompareContentState();
}

class _CompareContentState extends State<CompareContent> {
  late PageController controller1;
  late PageController controller2;

  @override
  void initState() {
    controller1 = PageController(initialPage: 0);
    controller2 = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  void _goToNextPageFirstList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = controller1.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      controller1.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeFirstPokemon(pokemonList[controller1.page!.toInt() + 1]);
  }

  void _goToNextPageSecondList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = controller2.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      controller2.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeSecondPokemon(pokemonList[controller2.page!.toInt() + 1]);
  }

  void _goToPreviousPageFirstList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = controller1.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      controller1.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeFirstPokemon(pokemonList[controller1.page!.toInt() - 1]);
  }

  void _goToPreviousPageSecondList(
    BuildContext context,
    List<PokemonModel> pokemonList,
  ) {
    final currentIndex = controller2.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      controller2.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<ComparesCubit>()
        .changeSecondPokemon(pokemonList[controller2.page!.toInt() - 1]);
  }

  @override
  Widget build(BuildContext context) {
    // final indexFirstPokemon = context.watch<ComparesCubit>().state.
    return BlocBuilder<ComparesCubit, ComparesState>(
      builder: (context, state) {
        if (state.pokemons.isNotEmpty) {
          return Column(
            children: [
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    _buildFirstList(state, context),
                    Expanded(
                      flex: 1,
                      child: Container(),
                    ),
                    _buildSecondList(state, context),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _buildStats(state)
            ],
          );
        }
        return Center(
          child: CupertinoActivityIndicator(),
        );
      },
    );
  }

  Widget _buildStats(ComparesState state) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          StatsPokemon(
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
          StatsPokemon(
            stats: 'Attack',
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
          StatsPokemon(
            stats: 'Defense',
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
          StatsPokemon(
            stats: 'Sp. Atk',
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
          StatsPokemon(
            stats: 'Sp. Def',
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
          StatsPokemon(
            stats: 'Speed',
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
          StatsPokemon(
            stats: 'Total',
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
          )
        ],
      ),
    );
  }

  Widget _buildSecondList(ComparesState state, BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButtonSearch(context, false),
          Container(
            height: 200,
            // color: Colors.blue,
            child: PageViewPokemonList(
              controller: controller2,
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
          MyText.labelMedium(
              context: context, text: state.secondPokemonSelected?.name ?? ''),
        ],
      ),
    );
  }

  Widget _buildFirstList(ComparesState state, BuildContext context) {
    return Expanded(
      flex: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildButtonSearch(context, true),
          Container(
            height: 200,
            // color: Colors.red,
            child: PageViewPokemonList(
              controller: controller1,
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
          MyText.labelMedium(
              context: context, text: state.firstPokemonSelected?.name ?? ''),
        ],
      ),
    );
  }

  Row _buildButtonSearch(BuildContext context, bool isFirstPokemon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonScaled(
          child: Row(
            children: [
              Icon(
                Icons.search_outlined,
                color: Colors.grey.shade400,
              ),
              SizedBox(width: 10),
              MyText.labelMedium(context: context, text: 'Search ...'),
            ],
          ),
          onPress: () async {
            final pokemon = await showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: ContentModalWidget(
                  title: const Text(''),
                  child: Expanded(
                    child: SearchPokemonPage(
                      searchCompare: true,
                    ),
                  ),
                ),
              ),
            );
            print(pokemon);
          },
        )
      ],
    );
  }
}
