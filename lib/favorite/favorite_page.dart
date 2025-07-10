import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/favorite/cubit/favorites_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/card_pokemon.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/utils/generate_stats.dart';
import 'package:pokedex/stats_pokemon/widgets/stats_pokemon.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildAppBar(),
        BlocBuilder<FavoritesCubit, FavoritesState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 90),
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: state.pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = state.pokemons[index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.transparent,
                              mappingColors(pokemon.typeofpokemon![0]),
                              Colors.black,
                            ],
                          ),
                        ),
                        child: ExpansionTile(
                          initiallyExpanded: true,
                          shape: Border.fromBorderSide(BorderSide.none),
                          collapsedShape:
                              Border.fromBorderSide(BorderSide.none),
                          clipBehavior: Clip.none,
                          childrenPadding: EdgeInsets.symmetric(vertical: 10),
                          tilePadding: EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          title: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: ImgPokemonShadow(
                                  pokemon: pokemon,
                                  imageGif:
                                      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
                                ),
                              ),
                              SizedBox(width: 16),
                              MyText.labelMedium(
                                context: context,
                                text: pokemon.name ?? '',
                                isFontBold: true,
                              ),
                            ],
                          ),
                          children: <Widget>[
                            Builder(
                              builder: (BuildContext context) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      SizedBox(height: 10),
                                      FavoriteCardSection(pokemon: pokemon),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: MyText.labelLarge(
        context: context,
        text: 'Favorites',
        isFontBold: true,
      ),
    );
  }
}

class FavoriteCardSection extends StatefulWidget {
  const FavoriteCardSection({
    super.key,
    required this.pokemon,
  });

  final PokemonModel pokemon;

  @override
  State<FavoriteCardSection> createState() => _FavoriteCardSectionState();
}

class _FavoriteCardSectionState extends State<FavoriteCardSection> {
  late StatsPokemonCubit statsPokemonCubit;

  @override
  void initState() {
    final stats = generateStats(widget.pokemon);
    statsPokemonCubit = StatsPokemonCubit()
      ..initialize(
        pokemon: widget.pokemon,
        stats: stats,
      );
    super.initState();
  }

  init() async {}

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: statsPokemonCubit,
      child: Column(
        children: [StatsPokemon()],
      ),
    );
  }
}
