import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/other_informations/utils/build_difference_text.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_with_type.dart';
import 'package:pokedex/pokemon/widget/single_stat_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class EvolutionLineContent extends StatelessWidget {
  const EvolutionLineContent({
    required this.pokemonFrom,
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemonFrom;
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildImage(context: context, pokemon: pokemonFrom),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: Center(
                  child: MyText.labelMedium(
                    context: context,
                    text: pokemon.reason ?? '',
                    isFontBold: true,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    _buildImage(context: context, pokemon: pokemon),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [],
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: _buildStats(pokemonFrom, null),
                ),
                Expanded(
                  flex: 4,
                  child: _buildDifferences(
                    context: context,
                    pokemon1: pokemonFrom,
                    pokemon2: pokemon,
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: _buildStats(pokemon, pokemonFrom),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStats(
    PokemonModel pokemon,
    PokemonModel? pokemonForDifference,
  ) {
    return Column(
      children: [
        _buildItemStats(
          desc: 'Hp',
          value: pokemon.hp ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.green,
          difference: pokemonForDifference != null
              ? pokemon.hp! - pokemonForDifference.hp!
              : null,
        ),
        _buildItemStats(
          desc: 'At',
          value: pokemon.attack ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.orange,
          difference: pokemonForDifference != null
              ? pokemon.attack! - pokemonForDifference.attack!
              : null,
        ),
        _buildItemStats(
          desc: 'De',
          value: pokemon.defense ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.red,
          difference: pokemonForDifference != null
              ? pokemon.defense! - pokemonForDifference.defense!
              : null,
        ),
        _buildItemStats(
          desc: 'Sa',
          value: pokemon.specialAttack ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.blue,
          difference: pokemonForDifference != null
              ? pokemon.specialAttack! - pokemonForDifference.specialAttack!
              : null,
        ),
        _buildItemStats(
            desc: 'Sd',
            value: pokemon.specialDefense ?? 0,
            statsUpdate: pokemon.infoUpdate ?? false,
            color: Colors.blueGrey,
            difference: pokemonForDifference != null
                ? pokemon.specialDefense! - pokemonForDifference.specialDefense!
                : null),
        _buildItemStats(
          desc: 'Sp',
          value: pokemon.speed ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.purple,
          difference: pokemonForDifference != null
              ? pokemon.speed! - pokemonForDifference.speed!
              : null,
        ),
        _buildItemStats(
          desc: 'To',
          value: pokemon.total ?? 0,
          statsUpdate: pokemon.infoUpdate ?? false,
          color: Colors.grey,
          difference: pokemonForDifference != null
              ? pokemon.total! - pokemonForDifference.total!
              : null,
          widthMax: 720,
        ),
      ],
    );
  }

  Widget _buildItemStats({
    required String desc,
    required int value,
    required bool statsUpdate,
    required Color color,
    required int? difference,
    int? widthMax,
  }) {
    return SinglStatPokemon(
      smallStats: true,
      stats: desc,
      value: statsUpdate ? value.toString() : '0',
      color: color,
      widthMax: widthMax ?? 250,
    );
  }

  Widget _buildDifferences({
    required BuildContext context,
    required PokemonModel pokemon1,
    required PokemonModel pokemon2,
  }) {
    return Column(
      children: [
        buildDifferenceText(context, pokemon2.hp! - pokemon1.hp!),
        buildDifferenceText(context, pokemon2.attack! - pokemon1.attack!),
        buildDifferenceText(context, pokemon2.defense! - pokemon1.defense!),
        buildDifferenceText(
            context, pokemon2.specialAttack! - pokemon1.specialAttack!),
        buildDifferenceText(
            context, pokemon2.specialDefense! - pokemon1.specialDefense!),
        buildDifferenceText(context, pokemon2.speed! - pokemon1.speed!),
        buildDifferenceText(context, pokemon2.total! - pokemon1.total!),
      ],
    );
  }

  Widget _buildImage(
      {required BuildContext context, required PokemonModel pokemon}) {
    return GestureDetector(
      onTap: () {
        context.push(ScreenPaths.detailPokemon, extra: {
          'pokemonSelected': pokemon,
          'gen': EnumGen.all,
        });
      },
      child: SizedBox(
        height: 80,
        child: ImgPokemonWithType(
          pokemon: pokemon,
          widthImage: 70,
          showType: true,
        ),
      ),
    );
  }
}
