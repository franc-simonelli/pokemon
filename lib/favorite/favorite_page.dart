import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/base_app_bar.dart';
import 'package:pokedex/favorite/widgets/favorite_content.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';
import 'package:pokedex/stats_pokemon/utils/generate_stats.dart';
import 'package:pokedex/stats_pokemon/widgets/stats_pokemon.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: true,
      child: CustomScrollView(
        controller: scrollController,
        physics: const ScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        slivers: [
          BaseAppBar(title: 'Favorites'),
          FavoriteContent(),
        ],
      ),
    );

    // return Column(
    //   children: [
    //     _buildAppBar(),
    //     FavoriteContent(),
    //   ],
    // );
  }

  // AppBar _buildAppBar() {
  //   return AppBar(
  //     backgroundColor: Colors.transparent,
  //     surfaceTintColor: Colors.transparent,
  //     automaticallyImplyLeading: true,
  //     centerTitle: true,
  //     title: MyText.labelLarge(
  //       context: context,
  //       text: 'Favorites',
  //       isFontBold: true,
  //     ),
  //   );
  // }
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
