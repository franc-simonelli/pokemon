import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_with_type.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';

class PageViewPokemonList extends StatelessWidget {
  const PageViewPokemonList({
    super.key,
    required this.controller,
    required this.list,
    required this.change,
    required this.showBack,
    required this.showForward,
    required this.onBack,
    required this.onForward,
    this.flex = 4,
    this.onlyPokemonImg = true,
    this.activeClickImg = false,
  });

  final PageController controller;
  final List<PokemonModel> list;
  final Function change;
  final bool showBack;
  final bool showForward;
  final Function onBack;
  final Function onForward;
  final int flex;
  final bool onlyPokemonImg;
  final bool activeClickImg;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: showBack
              ? IconButton(
                  onPressed: () {
                    onBack();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                )
              : Container(),
        ),
        Expanded(
          flex: flex,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return GestureDetector(
                onTap: () {
                  if (activeClickImg) {
                    context.push(ScreenPaths.detailPokemon, extra: {
                      'pokemonSelected': item,
                      'gen': EnumGen.all,
                    });
                  }
                },
                child: Stack(
                  children: [
                    onlyPokemonImg
                        ? ImgPokemonShadow(pokemon: item)
                        : ImgPokemonWithType(
                            pokemon: item,
                            showType: true,
                          ),
                  ],
                ),
              );
            },
            onPageChanged: (value) {
              controller.animateToPage(
                value,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              change(list[value]);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: showForward
              ? IconButton(
                  onPressed: () {
                    onForward();
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                )
              : Container(),
        ),
      ],
    );
  }
}
