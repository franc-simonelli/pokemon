import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late TableMovesCubit _tableMovesCubit;

  @override
  void initState() {
    super.initState();

    final pokemonRepository = context.read<PokemonRepository>();
    _tableMovesCubit = TableMovesCubit(
      id: widget.pokemon.id ?? '',
      pokemonRepository: pokemonRepository,
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
                TableMovesContent(),
              ],
            ),
          ],
        ),
      ),
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
          child: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }
}
