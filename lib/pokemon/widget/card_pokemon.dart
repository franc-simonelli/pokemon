import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/image_shadow.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.pokemon,
    this.gen = EnumGen.all,
  });

  final PokemonModel pokemon;
  final EnumGen gen;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slideAnimation =
        Tween<Offset>(begin: Offset(0, 0.5), end: Offset(0, 0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: GestureDetector(
          onTap: () {
            context.push(ScreenPaths.detailPokemon, extra: {
              'pokemonSelected': widget.pokemon,
              'gen': widget.gen,
            });
          },
          onTapDown: (_) {
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              _isPressed = false;
            });
          },
          onTapCancel: () {
            setState(() {
              _isPressed = false;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: _isPressed ? 0.7 : 1,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 100),
              curve: Curves.easeInOut,
              transformAlignment: Alignment.center,
              transform: _isPressed
                  ? Matrix4.identity().scaled(0.90)
                  : Matrix4.identity(),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade800,
                    offset: const Offset(0, -1),
                    blurRadius: 1,
                  ),
                  const BoxShadow(
                    color: Colors.black,
                    offset: Offset(2, 4),
                    blurRadius: 8,
                  )
                ],
                color: mappingColors(widget.pokemon.typeofpokemon![0]),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  // id
                  Positioned(
                    top: 5,
                    right: 10,
                    child: Stack(
                      children: [
                        MyText.labelSmall(
                          context: context,
                          isFontBold: true,
                          text: widget.pokemon.id ?? '',
                          color: Colors.white,
                          isBorderText: true,
                        ),
                      ],
                    ),
                  ),
                  // name
                  Positioned(
                    top: 25,
                    left: 5,
                    child: Stack(
                      children: [
                        MyText.labelLarge(
                          context: context,
                          text: widget.pokemon.name ?? '',
                          isFontBold: true,
                          color: Colors.white,
                          isBorderText: true,
                        ),
                      ],
                    ),
                  ),
                  // type image
                  Positioned(
                    top: 20,
                    right: -20,
                    child: ImageType(
                      typeImg: widget.pokemon.typeofpokemon![0],
                    ),
                  ),
                  // image pokemon
                  Positioned(
                    top: 50,
                    right: 0,
                    child: SizedBox(
                      height: 90,
                      width: 90,
                      child: ImageShadow(
                        pokemon: widget.pokemon,
                        // imageGif: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
                      ),
                    ),
                  ),
                  // list type
                  Positioned(
                    top: 70,
                    left: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...widget.pokemon.typeofpokemon!.mapIndexed(
                          (index, element) => Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: InfoSection(
                              element: element,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
