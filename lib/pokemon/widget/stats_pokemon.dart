import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class StatsPokemon extends StatelessWidget {
  const StatsPokemon({
    required this.stats,
    required this.value,
    required this.color,
    this.widthMax = 250,
    this.smallStats = false,
    super.key,
  });

  final String stats;
  final String value;
  final Color color;
  final int widthMax;
  final bool smallStats;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: smallStats ? 2 : 3,
          child: smallStats
              ? MyText.labelSmall(context: context, text: stats)
              : MyText.labelMedium(context: context, text: stats),
        ),
        Expanded(
          flex: smallStats ? 2 : 2,
          child: smallStats
              ? MyText.labelSmall(
                  context: context,
                  text: value,
                  textAlign: TextAlign.end,
                )
              : MyText.labelMedium(
                  context: context,
                  text: value,
                  textAlign: TextAlign.end,
                ),
        ),
        Expanded(
          flex: 1,
          child: Container(),
        ),
        Expanded(
          flex: smallStats ? 6 : 8,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final widthExpanded = constraints.maxWidth;
              final widthStats = int.parse(value) * widthExpanded / widthMax;
              return Stack(
                children: [
                  Container(
                    width: widthExpanded,
                    color: color.withOpacity(0.3),
                    height: smallStats ? 5 : 10,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: widthStats,
                    color: color,
                    height: smallStats ? 5 : 10,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
