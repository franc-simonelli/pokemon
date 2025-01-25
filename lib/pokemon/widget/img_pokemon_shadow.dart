import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ImgPokemonShadow extends StatelessWidget {
  const ImgPokemonShadow({
    required this.pokemon,
    // required this.imgDefault,
    this.imageGif,
    super.key,
  });

  final PokemonModel pokemon;
  final String? imageGif;
  // final String imgDefault;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.5,
      color: Colors.black,
      offset: const Offset(5, -3),
      sigma: 3,
      child: CachedNetworkImage(
        imageUrl: imageGif ?? pokemon.imageurl ?? '',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
          ),
        ),
        placeholder: (context, url) => const Center(
          child: Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
        // errorWidget: (context, url, error) => Image.asset(
        //   imgDefault,
        //   color: Colors.black,
        // ),
      ),
    );
  }
}
