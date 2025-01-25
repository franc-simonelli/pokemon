import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

buildDifferenceText(BuildContext context, int value) {
  String text = '';
  Color? color;
  if (value < 0) {
    color = Colors.red.shade400;
  }
  if (value > 0) {
    text += '+';
    color = Colors.green.shade400;
  }
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      MyText.labelSmall(
        context: context,
        text: '$text ${value.toString()}',
        color: color,
        isFontBold: true,
      ),
    ],
  );
}
