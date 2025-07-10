import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/compares/cubit/compares_cubit.dart';
import 'package:pokedex/compares/widgets/compare_content.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';
import 'package:pokedex/stats_pokemon/cubit/stats_pokemon_cubit.dart';

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
  late StatsPokemonCubit _statsFirstPokemonCubit;
  late StatsPokemonCubit _statsSecondPokemonCubit;
  late PageController controller1;
  late PageController controller2;

  @override
  void initState() {
    controller1 = PageController(initialPage: widget.initialIndex ?? 0);
    controller2 = PageController(initialPage: 0);
    final pokemonRepository = context.read<PokemonRepository>();
    _statsFirstPokemonCubit = StatsPokemonCubit();
    _statsSecondPokemonCubit = StatsPokemonCubit();
    _comparesCubit = ComparesCubit(
      statsFirstPokemonCubit: _statsFirstPokemonCubit,
      statsSecondPokemonCubit: _statsSecondPokemonCubit,
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
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _comparesCubit),
        BlocProvider.value(value: _statsFirstPokemonCubit),
        BlocProvider.value(value: _statsSecondPokemonCubit),
      ],
      child: Column(
        children: [
          _buildAppBar(),
          // SizedBox(height: appBarHeight + safeAreaHeight),
          CompareContent(
            controller1: controller1,
            controller2: controller2,
            firstStatsCubit: _statsFirstPokemonCubit,
            secondStatsCubit: _statsSecondPokemonCubit,
          ),
        ],
      ),
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
        text: 'Comparazing',
        isFontBold: true,
      ),
    );
  }
}
