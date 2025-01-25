import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon/widget/page_view_pokemon_list.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    super.key,
  });

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  late PageController controller;
  // int _currentIndex = 0;

  @override
  void initState() {
    // initalize();
    super.initState();
  }

  initalize() {
    final initialIndex = context.read<PokemonDetailCubit>().state.initialIndex;
    // _currentIndex = initialIndex ?? 0;
    controller = PageController(initialPage: initialIndex ?? 0);
  }

  void _goToNextPage(BuildContext context, List<PokemonModel> pokemonList) {
    final currentIndex = controller.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      controller.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<PokemonDetailCubit>()
        .changePokemon(pokemonList[controller.page!.toInt() + 1]);
  }

  void _goToPreviousPage(BuildContext context, List<PokemonModel> pokemonList) {
    final currentIndex = controller.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      controller.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<PokemonDetailCubit>()
        .changePokemon(pokemonList[controller.page!.toInt() - 1]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        if (state.initialIndex != null) {
          controller = PageController(initialPage: state.initialIndex ?? 0);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfo(context, state.pokemonSelected),
              _buildSectionImage(state, context),
            ],
          );
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildInfo(context, state.pokemonSelected),
              Expanded(
                flex: 10,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildSectionImage(PokemonDetailState state, BuildContext context) {
    return Expanded(
      flex: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: 200,
            child: PageViewPokemonList(
              flex: 6,
              controller: controller,
              list: state.pokemonList,
              showBack: state.pokemonList.isNotEmpty && !state.firstPokemon,
              showForward: state.pokemonList.isNotEmpty && !state.lastPokemon,
              change: context.read<PokemonDetailCubit>().changePokemon,
              onBack: () {
                _goToPreviousPage(
                  context,
                  state.pokemonList,
                );
              },
              onForward: () {
                _goToNextPage(
                  context,
                  state.pokemonList,
                );
              },
            ),
          ),
          SizedBox(height: 10),
          ButtonScaled(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
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
          )
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, PokemonModel pokemon) {
    return Expanded(
      flex: 7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.labelLarge(
            context: context,
            isFontBold: true,
            text: pokemon.id ?? '',
          ),
          SizedBox(height: 10),
          ...pokemon.typeofpokemon!.mapIndexed(
            (index, element) => Row(
              children: [
                InfoSection(
                  element: element,
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.catching_pokemon,
              color: mappingColors(pokemon.typeofpokemon![0]),
              size: 18,
            ),
            statUpdate: true,
            showContainer: true,
            value: pokemon.category ?? '',
          ),
          SizedBox(height: 16),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.male_outlined,
              color: Colors.blue,
              size: 18,
            ),
            statUpdate: true,
            value: pokemon.malePercentage ?? '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.female_outlined,
              color: Colors.pink,
              size: 18,
            ),
            statUpdate: true,
            value: pokemon.femalePercentage ?? '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.scale_outlined,
              color: Colors.brown,
              size: 18,
            ),
            statUpdate: pokemon.statsUpdate ?? false,
            value: pokemon.statsUpdate != null ? pokemon.weightMap : '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.straight_outlined,
              color: Colors.orange,
              size: 18,
            ),
            statUpdate: pokemon.statsUpdate ?? false,
            value: pokemon.statsUpdate != null ? pokemon.heightMap : '',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required BuildContext context,
    required Icon icon,
    required String value,
    bool? statUpdate = false,
    bool showContainer = false,
  }) {
    return Row(
      children: [
        showContainer
            ? Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  shape: BoxShape.circle,
                ),
                child: icon,
              )
            : icon,
        if (statUpdate == false) ...[
          SizedBox(width: 15),
          SizedBox(
            width: 5,
            height: 5,
            child: CupertinoActivityIndicator(),
          ),
        ],
        if (statUpdate!) ...[
          SizedBox(width: 5),
          MyText.labelMedium(
            context: context,
            text: value,
            isFontBold: false,
          )
        ]
      ],
    );
  }
}
