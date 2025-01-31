import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/pokemon/widget/single_stat_pokemon.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/widgets/slider_level.dart';

class StatsPokemon extends StatelessWidget {
  const StatsPokemon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsPokemonCubit, StatsPokemonState>(
      builder: (context, state) {
        bool infoUpdate = state.pokemon?.infoUpdate ?? false;
        StatsValueModel? stats = state.stats;
        return Column(
          children: [
            _buildLvSlider(state, context),
            Container(
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
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.hp.toString()
                          : '0',
                      color: Colors.green,
                    ),
                    SinglStatPokemon(
                      stats: 'Attack',
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.attack.toString()
                          : '0',
                      color: Colors.orange,
                    ),
                    SinglStatPokemon(
                      stats: 'Defense',
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.defense.toString()
                          : '0',
                      color: Colors.red,
                    ),
                    SinglStatPokemon(
                      stats: 'Sp. Atk',
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.specialAttack.toString()
                          : '0',
                      color: Colors.blue,
                    ),
                    SinglStatPokemon(
                      stats: 'Sp. Def',
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.specialDefense.toString()
                          : '0',
                      color: Colors.blueGrey,
                    ),
                    SinglStatPokemon(
                      stats: 'Speed',
                      widthMax: state.showLvSlider ? 400 : 250,
                      value: infoUpdate && stats != null
                          ? stats.speed.toString()
                          : '0',
                      color: Colors.purple,
                    ),
                    SinglStatPokemon(
                      stats: 'Total',
                      widthMax: state.showLvSlider ? 1600 : 720,
                      value: infoUpdate && stats != null
                          ? stats.total.toString()
                          : '0',
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLvSlider(StatsPokemonState state, BuildContext context) {
    return Row(
      children: [
        ButtonScaled(
          child: MyText.labelMedium(
            context: context,
            text: state.showLvSlider ? state.level.toString() : 'LV',
            isFontBold: true,
          ),
          onPress: () {
            context.read<StatsPokemonCubit>().showLvSlider();
          },
        ),
        if (state.showLvSlider)
          Expanded(
            child: SliderLevel(
              level: state.level,
              changeLevel: context.read<StatsPokemonCubit>().manageStatsByLv,
            ),
          ),
      ],
    );
  }
}
