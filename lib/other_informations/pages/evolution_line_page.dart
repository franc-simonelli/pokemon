import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/cubit/evolution_line_cubit.dart';
import 'package:pokedex/other_informations/widgets/evolution_from_to.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

class EvolutionLinePage extends StatelessWidget {
  const EvolutionLinePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          BlocBuilder<EvolutionLineCubit, EvolutionLineState>(
            builder: (context, state) {
              if (state.evolutionLineStatus == Status.success) {
                for (var item in state.evolutionLine) {
                  if (item.evolvedfrom != '') {
                    final pokemonFrom = context
                        .read<EvolutionLineCubit>()
                        .getPokemonByIdFromState(item.evolvedfrom ?? '');

                    widgets.add(Padding(
                      padding: const EdgeInsets.all(10),
                      child: EvolutionLineContent(
                        pokemon: item,
                        pokemonFrom: pokemonFrom,
                      ),
                    ));
                  }
                }
                return Column(
                  children: [
                    ...widgets,
                  ],
                );
              }
              if (state.evolutionLineStatus == Status.loading) {
                return Center(
                  child: CupertinoActivityIndicator(),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
