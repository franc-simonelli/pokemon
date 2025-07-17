import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/games/cubit/game_tab_cubit.dart';
import 'package:pokedex/other_informations/cubit/evolution_line_cubit.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/pages/evolution_line_page.dart';
import 'package:pokedex/other_informations/pages/moveset_page.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';
import 'package:pokedex/shared/widget/wallpaper_type_pokemon.dart';

class OtherInformation extends StatefulWidget {
  const OtherInformation({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  State<OtherInformation> createState() => _OtherInformationState();
}

class _OtherInformationState extends State<OtherInformation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MovesetCubit _movesetCubit;
  late GameTabCubit _gameTabCubit;
  late EvolutionLineCubit _evolutionLineCubit;
  late List<bool> _visitedTabs;
  bool showEffect = false;
  bool showSwitch = true;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _visitedTabs = List<bool>.filled(2, false);

    final movesetRepository = context.read<MovesetRepository>();
    final pokemonRepository = context.read<PokemonRepository>();
    _gameTabCubit = GameTabCubit();
    _movesetCubit = MovesetCubit(
      pokemon: widget.pokemon,
      movesetRepository: movesetRepository,
      pokemonRepository: pokemonRepository,
      gameTabCubit: _gameTabCubit,
    );

    _evolutionLineCubit = EvolutionLineCubit(
      evolutionLine: widget.pokemon.evolutions ?? [],
      pokemonRepository: pokemonRepository,
    );

    _tabController.addListener(() {
      setState(() {
        showSwitch = _tabController.index == 0 ? true : false;
      });
      if (_tabController.indexIsChanging) return;

      final currentIndex = _tabController.index;
      if (!_visitedTabs[currentIndex]) {
        if (currentIndex == 0) {
        } else if (currentIndex == 1) {
          _evolutionLineCubit.fetchEvolutionLine();
        }

        _visitedTabs[currentIndex] = true;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _movesetCubit),
        BlocProvider.value(value: _evolutionLineCubit)
      ],
      child: BlocBuilder<MovesetCubit, MovesetState>(
        builder: (context, state) {
          return PkmScaffold(
            appBar: _buildAppBar(widget.pokemon.name ?? '', context),
            body: Stack(
              children: [
                WallpaperTypePokemon(
                  type: state.pokemon!.typeofpokemon![0],
                ),
                Column(
                  children: [
                    SizedBox(height: appBarHeight + safeAreaHeight),
                    TabBar(
                      controller: _tabController,
                      tabs: [
                        Tab(text: 'Moveset'),
                        Tab(text: 'Evolution'),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          MovesetPage(
                            showEffect: showEffect,
                          ),
                          EvolutionLinePage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _buildAppBar(String title, BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_outlined),
        onPressed: () async {
          // await context.read<MovesetCubit>().closeStream();
          context.pop();
        },
      ),
      title: Row(
        children: [
          MyText.labelLarge(
            context: context,
            text: title,
            isFontBold: true,
            isBorderText: true,
            fontSize: 22,
          ),
        ],
      ),
      actions: [
        showSwitch ? _buildSwitchMoves() : Container(),
      ],
    );
  }

  Widget _buildSwitchMoves() {
    final appTheme = Theme.of(context).colorScheme;
    return Row(
      children: [
        MyText.labelSmall(context: context, text: 'Show  eff..'),
        SizedBox(width: 10),
        CupertinoSwitch(
          activeTrackColor: appTheme.primaryContainer,
          value: showEffect,
          onChanged: (value) {
            setState(() {
              showEffect = value;
            });
          },
        ),
      ],
    );
  }
}
