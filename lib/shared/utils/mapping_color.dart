import 'package:flutter/material.dart';
import 'package:pokedex/theme/app_colors.dart';

mappingColors(String type) {
  final typeLowerCase = type.toLowerCase();
  switch (typeLowerCase) {
    case 'grass':
      return const Color.fromARGB(255, 110, 185, 73);
    case 'poison':
      return const Color.fromARGB(255, 123, 70, 144);
    case 'fire':
      return const Color.fromARGB(255, 207, 83, 69);
    case 'flying':
      return AppColors.lightBlue;
    case 'water':
      return const Color.fromARGB(255, 52, 124, 190);
    case 'bug':
      return const Color.fromARGB(255, 126, 137, 25);
    case 'normal':
      return const Color.fromARGB(255, 192, 192, 141);
    case 'electric':
      return const Color.fromARGB(255, 203, 165, 61);
    case 'ground':
      return const Color.fromARGB(255, 104, 76, 65);
    case 'fairy':
      return const Color.fromARGB(255, 195, 80, 114);
    case 'fighting':
      return const Color.fromARGB(255, 206, 117, 22);
    case 'psychic':
      return const Color.fromARGB(255, 188, 120, 134);
    case 'rock':
      return const Color.fromARGB(255, 144, 125, 44);
    case 'ghost':
      return const Color.fromARGB(208, 70, 32, 159);
    case 'ice':
      return const Color.fromARGB(255, 137, 142, 184);
    case 'dragon':
      return const Color.fromARGB(255, 7, 42, 94);
    case 'dark':
      return const Color.fromARGB(255, 21, 21, 21);
    case 'steel':
      return const Color.fromARGB(255, 124, 124, 124);
  }
}
