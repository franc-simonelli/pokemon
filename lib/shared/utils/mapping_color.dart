import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_colors.dart';

mappingColors(type) {
  switch (type) {
    case 'Grass':
      return AppColors.lightGreen;
    case 'Poison':
      return AppColors.lightPurple;
    case 'Fire':
      return AppColors.red;
    case 'Flying':
      return AppColors.lightBlue;
    case 'Water':
      return AppColors.blue;
    case 'Bug':
      return AppColors.bug;
    case 'Normal':
      return AppColors.beige;
    case 'Electric':
      return AppColors.yellow;
    case 'Ground':
      return AppColors.darkBrown;
    case 'Fairy':
      return AppColors.pink;
    case 'Fighting':
      return AppColors.orange;
    case 'Psychic':
      return AppColors.lightPink;
    case 'Rock':
      return const Color(0xFFb8a038);
    case 'Ghost':
      return AppColors.violet;
    case 'Ice':
      return AppColors.indigo;
    case 'Dragon':
      return Colors.blue.shade900;
    case 'Dark':
      return Colors.black87;
    case 'Steel':
      return AppColors.grey;
  }
}
