import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/widgets/compare_content.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class ComparesPage extends StatefulWidget {
  const ComparesPage({
    this.initialIndex,
    super.key,
  });

  final int? initialIndex;

  @override
  State<ComparesPage> createState() => _ComparesPageState();
}

class _ComparesPageState extends State<ComparesPage> {
  late ComparesCubit _comparesCubit;
  late PageController controller1;
  late PageController controller2;

  @override
  void initState() {
    controller1 = PageController(initialPage: widget.initialIndex ?? 0);
    controller2 = PageController(initialPage: 0);
    final pokemonRepository = context.read<PokemonRepository>();
    _comparesCubit = ComparesCubit(
      pokemonRepository: pokemonRepository,
      initialIndex: widget.initialIndex,
    );

    super.initState();
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    _comparesCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _comparesCubit,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          // toolbarHeight: 100,
          title: BlocBuilder<ComparesCubit, ComparesState>(
            builder: (context, state) {
              return Column(
                children: [
                  MyText.labelLarge(
                    context: context,
                    text: 'Comparazing',
                    isFontBold: true,
                  ),
                  // SizedBox(height: 10),
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     Expanded(
                  //       flex: 4,
                  //       child: _buildButton(
                  //         context,
                  //         true,
                  //         state.pokemons,
                  //       ),
                  //     ),
                  //     Expanded(
                  //       flex: 1,
                  //       child: Container(),
                  //     ),
                  //     Expanded(
                  //       flex: 4,
                  //       child: _buildButton(
                  //         context,
                  //         false,
                  //         state.pokemons,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              );
            },
          ),
        ),
        body: CompareContent(
          controller1: controller1,
          controller2: controller2,
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    bool isFirstPokemon,
    List<PokemonModel> pokemons,
  ) {
    return ButtonScaled(
      child: Row(
        children: [
          Icon(
            Icons.search_outlined,
            color: Colors.grey.shade400,
          ),
          SizedBox(width: 10),
          MyText.labelMedium(context: context, text: 'Search ...'),
        ],
      ),
      onPress: () async {
        PokemonModel? pokemon =
            await context.push(ScreenPaths.searchPokemon, extra: true);
        final index = pokemons.indexWhere(
          (element) {
            return element.id == pokemon?.id;
          },
        );
        if (pokemon != null) {
          if (isFirstPokemon) {
            controller1.jumpToPage(index);
          } else {
            controller2.jumpToPage(index);
          }
        }
      },
    );
  }
}
