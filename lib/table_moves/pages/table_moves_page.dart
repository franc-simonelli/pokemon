import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/button_favorite.dart';
import 'package:pokedex/games/cubit/game_tab_cubit.dart';
import 'package:pokedex/games/widgets/games_tab.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';
import 'package:pokedex/shared/widget/wallpaper_type_pokemon.dart';
import 'package:pokedex/table_moves/cubit/table_moves_cubit.dart';
import 'package:pokedex/table_moves/widgets/table_moves_content.dart';

class TableMovesPage extends StatefulWidget {
  const TableMovesPage({
    required this.pokemon,
    super.key,
  });

  final PokemonModel pokemon;

  @override
  State<TableMovesPage> createState() => _TableMovesPageState();
}

class _TableMovesPageState extends State<TableMovesPage> {
  late GameTabCubit _gameTabCubit;
  late TableMovesCubit _tableMovesCubit;

  @override
  void initState() {
    super.initState();

    final pokemonRepository = context.read<PokemonRepository>();
    _gameTabCubit = GameTabCubit();
    _tableMovesCubit = TableMovesCubit(
      id: widget.pokemon.id ?? '',
      pokemonRepository: pokemonRepository,
      gameTabCubit: _gameTabCubit,
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;

    return BlocProvider.value(
      value: _tableMovesCubit,
      child: PkmScaffold(
        appBar: _buildAppBar(widget.pokemon.name ?? ''),
        body: Stack(
          children: [
            WallpaperTypePokemon(
              type: widget.pokemon.typeofpokemon![0],
            ),
            Column(
              children: [
                SizedBox(height: appBarHeight + safeAreaHeight),
                SizedBox(height: 10),
                _buildGamesTab(),
                SizedBox(height: 10),
                TableMovesContent(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGamesTab() {
    return BlocBuilder<TableMovesCubit, TableMovesState>(
      builder: (context, state) {
        final gameTabCubit = context.watch<TableMovesCubit>().gameTabCubit;
        return GamesTab(
          games: gameTabCubit.state.games,
          gameSelected: gameTabCubit.state.gameSelected,
          onGameSelected: (game) {
            gameTabCubit.changeGameSelected(game);
          },
        );
      },
    );
  }

  AppBar _buildAppBar(String title) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
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
          child: ButtonFavorite(
            pokemon: widget.pokemon,
          ),
        ),
      ],
    );
  }
}
