import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/cubit/evolution_line_cubit.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/pages/evolution_line_page.dart';
import 'package:pokedex/other_informations/pages/moveset_page.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

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
  late EvolutionLineCubit _evolutionLineCubit;
  late List<bool> _visitedTabs;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _visitedTabs = List<bool>.filled(2, false);

    final movesetRepository = context.read<MovesetRepository>();
    final pokemonRepository = context.read<PokemonRepository>();
    _movesetCubit = MovesetCubit(
      pokemon: widget.pokemon,
      movesetRepository: movesetRepository,
      pokemonRepository: pokemonRepository,
    );
    _evolutionLineCubit = EvolutionLineCubit(
      evolutionLine: widget.pokemon.evolutions ?? [],
      pokemonRepository: pokemonRepository,
    );

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;

      final currentIndex = _tabController.index;
      if (!_visitedTabs[currentIndex]) {
        if (currentIndex == 0) {
          // _movesetCubit.initialize();
        } else if (currentIndex == 1) {
          _evolutionLineCubit.fetchEvolutionLine();
        }

        _visitedTabs[currentIndex] = true; // Segna il tab come visitato
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _movesetCubit),
        BlocProvider.value(value: _evolutionLineCubit)
      ],
      child: Scaffold(
        appBar: _buildAppBar(widget.pokemon.name ?? ''),
        body: Stack(children: [
          Positioned(
            top: -30,
            right: -80,
            child: SizedBox(
              width: 400,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  mappingType(
                    widget.pokemon.typeofpokemon?[0] ?? '',
                  ),
                  fit: BoxFit.cover,
                  // fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Column(
            children: [
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
                    MovesetPage(),
                    EvolutionLinePage(),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: Row(
        children: [
          MyText.labelLarge(
            context: context,
            text: title,
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }
}
