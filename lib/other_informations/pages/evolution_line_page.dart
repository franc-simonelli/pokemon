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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
              return Column(
                children: [
                  ...widgets,
                ],
              );
              // return Container(
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.grey.shade800,
              //         offset: const Offset(-1, -1),
              //       ),
              //       const BoxShadow(
              //         color: Colors.black,
              //         offset: Offset(2, 2),
              //       )
              //     ],
              //   ),
              //   clipBehavior: Clip.antiAlias,
              //   child: ExpansionTile(
              //     initiallyExpanded: true,
              //     shape: RoundedRectangleBorder(
              //       side: BorderSide(color: Colors.transparent),
              //       borderRadius: BorderRadius.zero,
              //     ),
              //     collapsedBackgroundColor: Colors.grey.shade900,
              //     backgroundColor: Colors.grey.shade900,
              //     title: MyText.labelMedium(
              //         context: context, text: 'Evolution line'),
              //     leading: Icon(Icons.info),
              //     iconColor: Colors.white,
              //     children: [...widgets],
              //   ),
              // );
            }
            return Container();
          },
        )
      ],
    );
  }
}
