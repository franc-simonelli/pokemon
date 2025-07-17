import 'package:flutter/material.dart';
import 'package:pokedex/other_informations/utils/stone_evolutions.dart';
import 'package:pokedex/shared/utils/regex_level_up.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

Widget buildReasonEvolution(BuildContext context, String reason) {
  if (reason.toLowerCase().contains('trade')) {
    final imageItem = getItemEvolution(reason);
    return Column(
      children: [
        Image.asset(
          imageItem,
          width: 30,
        ),
        SizedBox(height: 4),
        MyText.labelSmall(
          context: context,
          text: 'Scambio',
          isFontBold: true,
        ),
      ],
    );
  }

  if (reason.toLowerCase().contains('high friendship') ||
      reason.toLowerCase().contains('affection')) {
    Widget? widg;
    if (reason.toLowerCase().contains('nighttime')) {
      widg = MyText.labelSmall(
        context: context,
        text: 'Notte',
        isFontBold: true,
      );
    }
    if (reason.toLowerCase().contains('daytime')) {
      widg = MyText.labelSmall(
        context: context,
        text: 'Giorno',
        isFontBold: true,
      );
    }
    return Column(
      children: [
        Image.asset(
          'assets/images/affection.png',
          width: 30,
        ),
        SizedBox(height: 4),
        widg ?? Container(),
      ],
    );
  }

  if (reason.toLowerCase().contains('level up near')) {
    final location = reason
        .replaceAll('(', '')
        .replaceAll(')', '')
        .replaceAll('level up near an ', '')
        .replaceAll('level up near a ', '');
    return Column(
      children: [
        Image.asset(
          'assets/images/map_city.png',
          width: 30,
        ),
        SizedBox(height: 4),
        MyText.labelSmall(
          context: context,
          text: location,
          isFontBold: true,
        ),
      ],
    );
  }

  if (reason.toLowerCase().contains('level')) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/candy.png',
          width: 30,
        ),
        SizedBox(width: 8),
        MyText.labelMedium(
          context: context,
          text: extractLevel(reason).toString(),
          isFontBold: true,
        )
      ],
    );
  } else if (reason.toLowerCase().contains('stone')) {
    final imageStone = getStoneEvolution(reason);
    return Image.asset(
      imageStone,
      width: 30,
    );
  }
  return Container();
}
