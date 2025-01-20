import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/evolution_line/cubit/evolution_line_cubit.dart';
import 'package:pokedex/evolution_line/widgets/evolution_from_to.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class EvolutionLinePage extends StatefulWidget {
  const EvolutionLinePage({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  State<EvolutionLinePage> createState() => _EvolutionLinePageState();
}

class _EvolutionLinePageState extends State<EvolutionLinePage> {
  late EvolutionLineCubit _evolutionLineCubit;

  @override
  void initState() {
    final pokemonRepository = context.read<PokemonRepository>();
    _evolutionLineCubit = EvolutionLineCubit(
      evolutionLine: widget.pokemon.evolutions ?? [],
      pokemonRepository: pokemonRepository,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _evolutionLineCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    return BlocProvider.value(
      value: _evolutionLineCubit,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MyText.labelLarge(context: context, text: 'Evolution line'),
          SizedBox(height: 10),
          BlocBuilder<EvolutionLineCubit, EvolutionLineState>(
            builder: (context, state) {
              if (state.evolutionLineStatus == Status.success) {
                for (var item in state.evolutionLine) {
                  if (item.evolvedfrom != '') {
                    widgets.add(Padding(
                      padding: const EdgeInsets.all(10),
                      child: EvolutionLineContent(
                        pokemon: item,
                      ),
                    ));
                  }
                }
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade800,
                        offset: const Offset(-1, -1),
                      ),
                      const BoxShadow(
                        color: Colors.black,
                        offset: Offset(2, 2),
                      )
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ExpansionTile(
                    initiallyExpanded: true,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.zero,
                    ),
                    collapsedBackgroundColor: Colors.grey.shade900,
                    backgroundColor: Colors.grey.shade900,
                    title: MyText.labelMedium(
                        context: context, text: 'Evolution line'),
                    leading: Icon(Icons.info),
                    iconColor: Colors.white,
                    children: [...widgets],
                  ),
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
