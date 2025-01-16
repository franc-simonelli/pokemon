import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:simple_shadow/simple_shadow.dart';

class ImageShadow extends StatelessWidget {
  const ImageShadow({
    required this.pokemon,
    // required this.imgDefault,
    super.key,
  });

  final PokemonModel pokemon;
  // final String imgDefault;

  @override
  Widget build(BuildContext context) {
    return SimpleShadow(
      opacity: 0.5,
      color: Colors.black,
      offset: const Offset(5, -3),
      sigma: 3,
      child: CachedNetworkImage(
        imageUrl: pokemon.imageurl ?? '',
        imageBuilder: (context, imageProvider) => Container(
          // width: double.infinity,
          // width: 100,
          decoration: BoxDecoration(
            image: DecorationImage(image: imageProvider),
          ),
        ),
        placeholder: (context, url) => const Center(
          // child: Image.asset(
          //   imgDefault,
          //   color: Colors.black,
          //   width: 100,
          // ),
          child: Center(
            child: CircularProgressIndicator(),
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
