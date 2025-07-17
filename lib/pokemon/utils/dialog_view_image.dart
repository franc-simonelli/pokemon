// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/view_images_pokemon.dart';

showDialogImageView(BuildContext context, PokemonModel pokemon) async {
  await showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.8),
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: Colors.transparent,
          child: ViewImagesPokemon(pokemon: pokemon));
    },
  );
}
