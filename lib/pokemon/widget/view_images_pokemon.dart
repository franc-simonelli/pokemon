import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_pokemon.dart';

class ViewImagesPokemon extends StatelessWidget {
  const ViewImagesPokemon({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Container(
        // color: Colors.green,
        child: Stack(
          children: [
            ImagePokemon(
              pokemon: pokemon,
              widthImage: 250,
              widthType: 300,
              showType: true,
            ),
            Positioned(
              top: 10,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  context.pop();
                },
                child: Icon(
                  Icons.close,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
