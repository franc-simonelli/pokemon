import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_pokemon.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';
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

  @override
  void initState() {
    initalize();
    super.initState();
  }

  initalize() {
    final initialIndex = context.read<PokemonDetailCubit>().state.initialIndex;
    controller = PageController(initialPage: initialIndex ?? 0);
  }

  void _goToNextPage(List<PokemonModel> pokemonList) {
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

  void _goToPreviousPage(List<PokemonModel> pokemonList) {
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
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: state.pokemonList.isNotEmpty && !state.firstPokemon
                        ? GestureDetector(
                            onTap: () {
                              _goToPreviousPage(state.pokemonList);
                            },
                            child: Icon(Icons.arrow_back_ios_new_rounded),
                          )
                        : Container(),
                  ),
                  Expanded(
                    flex: 7,
                    child: SizedBox(
                      height: 180,
                      width: 180,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: controller,
                        itemCount: state.pokemonList.length,
                        itemBuilder: (context, index) {
                          final item = state.pokemonList[index];
                          return ImagePokemon(pokemon: item);
                        },
                        onPageChanged: (value) {
                          controller.animateToPage(
                            value,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          context
                              .read<PokemonDetailCubit>()
                              .changePokemon(state.pokemonList[value]);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: state.pokemonList.isNotEmpty && !state.lastPokemon
                        ? GestureDetector(
                            onTap: () {
                              _goToNextPage(state.pokemonList);
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded))
                        : Container(),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            _buildInfo(context, state.pokemonSelected),
          ],
        );
      },
    );
  }

  Widget _buildInfo(BuildContext context, PokemonModel pokemon) {
    return Expanded(
      flex: 5,
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
            (index, element) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: InfoSection(
                pokemon: pokemon,
                element: element,
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Icon(
                Icons.male_outlined,
                color: Colors.blue,
              ),
              SizedBox(width: 5),
              MyText.labelMedium(
                context: context,
                text: pokemon.malePercentage ?? '',
                isFontBold: true,
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.female_outlined,
                color: Colors.pink,
              ),
              SizedBox(width: 5),
              MyText.labelMedium(
                context: context,
                text: pokemon.femalePercentage ?? '',
                isFontBold: true,
              )
            ],
          )
        ],
      ),
    );
  }
}
