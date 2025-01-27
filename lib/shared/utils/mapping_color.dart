import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_colors.dart';

mappingColors(String type) {
  final typeLowerCase = type.toLowerCase();
  switch (typeLowerCase) {
    case 'grass':
      return AppColors.lightGreen;
    case 'poison':
      return AppColors.lightPurple;
    case 'fire':
      return AppColors.red;
    case 'flying':
      return AppColors.lightBlue;
    case 'water':
      return AppColors.blue;
    case 'bug':
      return AppColors.bug;
    case 'normal':
      return AppColors.beige;
    case 'electric':
      return AppColors.yellow;
    case 'ground':
      return AppColors.darkBrown;
    case 'fairy':
      return AppColors.pink;
    case 'fighting':
      return AppColors.orange;
    case 'psychic':
      return AppColors.lightPink;
    case 'rock':
      return const Color(0xFFb8a038);
    case 'ghost':
      return AppColors.violet;
    case 'ice':
      return AppColors.indigo;
    case 'dragon':
      return Colors.blue.shade900;
    case 'dark':
      return Colors.black;
    case 'steel':
      return Colors.grey;
  }
}
