import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/utils/dialog_view_image.dart';
import 'package:pokedex/pokemon/widget/image_pokemon.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({
    super.key,
  });

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  late PageController controller;
  // int _currentIndex = 0;

  @override
  void initState() {
    // initalize();
    super.initState();
  }

  initalize() {
    final initialIndex = context.read<PokemonDetailCubit>().state.initialIndex;
    // _currentIndex = initialIndex ?? 0;
    controller = PageController(initialPage: initialIndex ?? 0);
  }

  void _goToNextPage(List<PokemonModel> pokemonList) {
    final currentIndex = controller.page?.toInt() ?? 0;
    if (currentIndex < pokemonList.length - 1) {
      controller.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<PokemonDetailCubit>()
        .changePokemon(pokemonList[controller.page!.toInt() + 1]);
  }

  void _goToPreviousPage(List<PokemonModel> pokemonList) {
    final currentIndex = controller.page?.toInt() ?? 0;
    if (currentIndex > 0) {
      controller.animateToPage(
        currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
    context
        .read<PokemonDetailCubit>()
        .changePokemon(pokemonList[controller.page!.toInt() - 1]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
      builder: (context, state) {
        if (state.initialIndex != null) {
          controller = PageController(initialPage: state.initialIndex ?? 0);
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfo(context, state.pokemonSelected),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              _buildSectionImage(state, context),
            ],
          );
        } else {
          return Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildInfo(context, state.pokemonSelected),
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 10,
                child: Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildSectionImage(PokemonDetailState state, BuildContext context) {
    return Expanded(
      flex: 10,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: state.pokemonList.isNotEmpty && !state.firstPokemon
                ? IconButton(
                    onPressed: () {
                      _goToPreviousPage(state.pokemonList);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                  )
                : Container(),
          ),
          Expanded(
            flex: 6,
            child: SizedBox(
              height: 180,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: controller,
                itemCount: state.pokemonList.length,
                itemBuilder: (context, index) {
                  final item = state.pokemonList[index];
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: 1,
                    child: GestureDetector(
                      onDoubleTap: () async {
                        await showDialogImageView(context, item);
                      },
                      child: ImagePokemon(
                        pokemon: item,
                      ),
                      // child: SizedBox(
                      //   child: Image.network(
                      //     'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${index + 1}.gif',
                      //     filterQuality: FilterQuality.high,
                      //     fit: BoxFit.contain,
                      //   ),
                      // ),
                    ),
                  );
                },
                onPageChanged: (value) {
                  controller.animateToPage(
                    value,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  context
                      .read<PokemonDetailCubit>()
                      .changePokemon(state.pokemonList[value]);
                  // setState(() {
                  //   _currentIndex = value;
                  // });
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: state.pokemonList.isNotEmpty && !state.lastPokemon
                ? IconButton(
                    onPressed: () {
                      _goToNextPage(state.pokemonList);
                    },
                    icon: Icon(Icons.arrow_forward_ios_rounded),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context, PokemonModel pokemon) {
    return Expanded(
      flex: 6,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText.labelLarge(
            context: context,
            isFontBold: true,
            text: pokemon.id ?? '',
          ),
          SizedBox(height: 10),
          ...pokemon.typeofpokemon!.mapIndexed(
            (index, element) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: InfoSection(
                element: element,
              ),
            ),
          ),
          SizedBox(height: 10),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.catching_pokemon,
              color: mappingColors(pokemon.typeofpokemon![0]),
              size: 18,
            ),
            statUpdate: true,
            value: pokemon.category ?? '',
          ),
          SizedBox(height: 16),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.male_outlined,
              color: Colors.blue,
              size: 18,
            ),
            statUpdate: true,
            value: pokemon.malePercentage ?? '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.female_outlined,
              color: Colors.pink,
              size: 18,
            ),
            statUpdate: true,
            value: pokemon.femalePercentage ?? '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.scale_outlined,
              color: Colors.brown,
              size: 18,
            ),
            statUpdate: pokemon.statsUpdate ?? false,
            value: pokemon.statsUpdate != null ? pokemon.weightMap : '',
          ),
          SizedBox(height: 5),
          _buildInfoItem(
            context: context,
            icon: Icon(
              Icons.straight_outlined,
              color: Colors.orange,
              size: 18,
            ),
            statUpdate: pokemon.statsUpdate ?? false,
            value: pokemon.statsUpdate != null ? pokemon.heightMap : '',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required BuildContext context,
    required Icon icon,
    required String value,
    bool? statUpdate = false,
  }) {
    return Row(
      children: [
        icon,
        if (statUpdate == false) ...[
          SizedBox(width: 15),
          SizedBox(
            width: 5,
            height: 5,
            child: CupertinoActivityIndicator(),
          ),
        ],
        if (statUpdate!) ...[
          SizedBox(width: 5),
          MyText.labelMedium(
            context: context,
            text: value,
            isFontBold: false,
          )
        ]
        // SizedBox(width: 5),
        // MyText.labelMedium(
        //   context: context,
        //   text: value,
        //   isFontBold: false,
        // )
      ],
    );
  }
}
