import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/evolution_line/cubit/evolution_line_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/widget/image_pokemon.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class EvolutionLineContent extends StatefulWidget {
  const EvolutionLineContent({
    // required this.pokemonFrom,
    required this.pokemon,
    super.key,
  });

  // final PokemonModel pokemonFrom;
  final PokemonModel pokemon;

  @override
  State<EvolutionLineContent> createState() => _EvolutionLineContentState();
}

class _EvolutionLineContentState extends State<EvolutionLineContent> {
  PokemonModel? pokemonFrom;

  @override
  void initState() {
    fetchPokemonFrom();
    super.initState();
  }

  fetchPokemonFrom() async {
    final item = await context
        .read<EvolutionLineCubit>()
        .getPokemonFrom(widget.pokemon.evolvedfrom ?? '');
    setState(() {
      pokemonFrom = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return pokemonFrom != null
        ? Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.shade800,
              //     offset: const Offset(-2, -2),
              //   ),
              //   const BoxShadow(
              //     color: Colors.black,
              //     offset: Offset(3, 3),
              //   )
              // ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: ImagePokemon(pokemon: pokemonFrom!),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 4,
                    child: Center(
                      child: MyText.labelMedium(
                        context: context,
                        text: widget.pokemon.reason ?? '',
                        isFontBold: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  Expanded(
                    flex: 3,
                    child: ImagePokemon(pokemon: widget.pokemon),
                  ),
                ],
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator.adaptive(),
            ],
          );
  }
}
