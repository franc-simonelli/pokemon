import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/widgets/compare_content.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/image_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class ComparesPage extends StatefulWidget {
  const ComparesPage({super.key});

  @override
  State<ComparesPage> createState() => _ComparesPageState();
}

class _ComparesPageState extends State<ComparesPage> {
  late ComparesCubit _comparesCubit;

  @override
  void initState() {
    final pokemonRepository = context.read<PokemonRepository>();
    _comparesCubit = ComparesCubit(
      pokemonRepository: pokemonRepository,
    );
    super.initState();
  }

  @override
  void dispose() {
    _comparesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _comparesCubit,
      child: Scaffold(
        appBar: AppBar(
          title: MyText.labelLarge(
            context: context,
            text: 'Compare',
            isFontBold: true,
          ),
          centerTitle: false,
        ),
        body: CompareContent(),
      ),
    );
  }
}

class PageViewPokemonList extends StatelessWidget {
  const PageViewPokemonList({
    super.key,
    required this.controller,
    required this.list,
    required this.change,
    required this.showBack,
    required this.showForward,
    required this.onBack,
    required this.onForward,
  });

  final PageController controller;
  final List<PokemonModel> list;
  final Function change;
  final bool showBack;
  final bool showForward;
  final Function onBack;
  final Function onForward;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: showBack
              ? IconButton(
                  onPressed: () {
                    onBack();
                  },
                  icon: Icon(Icons.arrow_back_ios_new_rounded),
                )
              : Container(),
        ),
        Expanded(
          flex: 4,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: controller,
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return GestureDetector(
                onTap: () {
                  context.push(ScreenPaths.detailPokemon, extra: {
                    'pokemonSelected': item,
                    'gen': EnumGen.all,
                  });
                },
                child: Stack(
                  children: [
                    ImagePokemon(
                      pokemon: item,
                      showType: true,
                    ),
                  ],
                ),
              );
            },
            onPageChanged: (value) {
              controller.animateToPage(
                value,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
              change(list[value]);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: showForward
              ? IconButton(
                  onPressed: () {
                    onForward();
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded),
                )
              : Container(),
        ),
      ],
    );
  }
}
