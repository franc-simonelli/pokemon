import 'package:flutter/material.dart';
import 'package:pokedex/other_informations/utils/build_difference_text.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class StatsPokemon extends StatelessWidget {
  const StatsPokemon({
    required this.stats,
    required this.value,
    required this.color,
    this.widthMax = 250,
    this.smallStats = false,
    this.valueCompare = '',
    super.key,
  });

  final String stats;
  final String value;
  final Color color;
  final int widthMax;
  final bool smallStats;
  final String valueCompare;

  @override
  Widget build(BuildContext context) {
    var flexDesc = smallStats ? 2 : 3;
    var flexValue = smallStats ? 2 : 2;
    var flexWidth = smallStats ? 6 : 8;

    if (valueCompare != '') {
      flexDesc = 2;
      flexValue = 1;
      flexWidth = 4;
    }

    return Row(
      children: [
        Expanded(
          flex: flexDesc,
          child: Container(
            // color: Colors.red,
            child: smallStats
                ? MyText.labelSmall(context: context, text: stats)
                : MyText.labelMedium(context: context, text: stats),
          ),
        ),
        Expanded(
          flex: flexValue,
          child: Container(
            // color: Colors.blue,
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
        ),
        if (valueCompare == '')
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.green,
            ),
          ),
        if (valueCompare != '') ...[
          SizedBox(width: 10),
          Expanded(
            flex: flexValue,
            child: Container(
              child: smallStats
                  ? MyText.labelSmall(
                      context: context,
                      text: valueCompare,
                      textAlign: TextAlign.end,
                    )
                  : MyText.labelMedium(
                      context: context,
                      text: valueCompare,
                      textAlign: TextAlign.end,
                    ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: buildDifferenceText(
                context,
                (int.parse(value) - int.parse(valueCompare)),
              ),
            ),
          ),
        ],
        Expanded(
          flex: flexWidth,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final widthExpanded = constraints.maxWidth;
              final widthStats = int.parse(value) * widthExpanded / widthMax;
              double widthCompareStats = 0.0;
              if (valueCompare != '') {
                widthCompareStats =
                    int.parse(valueCompare) * widthExpanded / widthMax;
              }
              return Stack(
                children: [
                  Container(
                    width: widthExpanded,
                    color: color.withOpacity(0.3),
                    height: smallStats ? 5 : 10,
                  ),
                  if (valueCompare == '')
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: widthStats,
                      color: color,
                      height: smallStats ? 5 : 10,
                    ),
                  if (valueCompare != '') ...[
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: widthCompareStats,
                      color: color,
                      height: smallStats ? 5 : 10,
                    ),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: widthStats,
                      color: color.withOpacity(0.3),
                      height: smallStats ? 5 : 10,
                    ),
                  ]
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
