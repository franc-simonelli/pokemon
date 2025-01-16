import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class StatsPokemon extends StatelessWidget {
  const StatsPokemon({
    required this.stats,
    required this.value,
    required this.color,
    this.widthMax = 250,
    super.key,
  });

  final String stats;
  final String value;
  final Color color;
  final int widthMax;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: MyText.labelMedium(
            context: context,
            text: stats,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: MyText.labelMedium(
              context: context,
              text: value,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final widthExpanded = constraints.maxWidth;
              final widthStats = int.parse(value) * widthExpanded / widthMax;
              return Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: widthExpanded,
                    color: color.withOpacity(0.3),
                    height: 10,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: widthStats,
                    color: color,
                    height: 10,
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
