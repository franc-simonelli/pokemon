import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
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
    return BlocProvider.value(
      value: _tableMovesCubit,
      child: Scaffold(
        appBar: _buildAppBar(widget.pokemon.name ?? ''),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          child: Stack(
            children: [
              // Positioned(
              //   top: 0,
              //   right: -110,
              //   child: Opacity(
              //     opacity: 1,
              //     child: ImgType(
              //       width: 450,
              //       typeImg: widget.pokemon.typeofpokemon![0],
              //       boxFit: BoxFit.contain,
              //       colorGradient: [
              //         Colors.black87,
              //         Colors.black54,
              //         mappingColors(
              //           widget.pokemon.typeofpokemon![0],
              //         ),
              //         Colors.black54,
              //         mappingColors(
              //           widget.pokemon.typeofpokemon![0],
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              TableMovesContent(),
            ],
          ),
        ),
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
