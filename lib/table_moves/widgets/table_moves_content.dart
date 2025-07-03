import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/shared/utils/capitaliza_first_letter.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/table_moves/cubit/table_moves_cubit.dart';

class TableMovesContent extends StatelessWidget {
  const TableMovesContent({super.key});

  @override
  Widget build(BuildContext context) {
    // final appBarHeight = AppBar().preferredSize.height;
    // final safeAreaHeight = MediaQuery.of(context).padding.top;
    return BlocBuilder<TableMovesCubit, TableMovesState>(
      builder: (context, state) {
        if (state.movesStatus == Status.loading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.movesStatus == Status.success) {
          return Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    _buildTableLevelUp(context, state),
                    SizedBox(height: 30),
                    _buildTableMachine(context, state),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }

  Widget _buildTableLevelUp(BuildContext context, TableMovesState state) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.grey.shade800,
          width: 1,
        ),
        verticalInside: BorderSide(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(6),
        2: FlexColumnWidth(6),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
      },
      children: [
        _buildTableHeader(context, true),
        ..._buildTableRows(
          context: context,
          moves: state.moveLevelUp,
          isTableLevel: true,
        ),
      ],
    );
  }

  Widget _buildTableMachine(BuildContext context, TableMovesState state) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      border: TableBorder(
        horizontalInside: BorderSide(
          color: Colors.grey.shade800,
          width: 1,
        ),
        verticalInside: BorderSide(
          color: Colors.grey.shade800,
          width: 1,
        ),
      ),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(6),
        2: FlexColumnWidth(6),
        3: FlexColumnWidth(2),
        4: FlexColumnWidth(2),
        5: FlexColumnWidth(2),
        6: FlexColumnWidth(2),
      },
      children: [
        _buildTableHeader(context, false),
        ..._buildTableRows(
          context: context,
          moves: state.moveMachine,
          isTableLevel: false,
        ),
      ],
    );
  }

  TableRow _buildTableHeader(BuildContext context, bool isTableLevelUp) {
    return TableRow(
      children: [
        _buildItemHeader(
          child: _buildCell(isTableLevelUp ? "Lv" : 'MT', context,
              isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child:
              _buildCell("Move", context, isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child:
              _buildCell('Type', context, isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child:
              _buildCell('Cat.', context, isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child: _buildCell("Pow", context, isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child: _buildCell("Acc", context, isWeight: true, isTextCenter: true),
        ),
        _buildItemHeader(
          child: _buildCell("PP", context, isWeight: true, isTextCenter: true),
        ),
      ],
    );
  }

  _buildItemHeader({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: child,
    );
  }

  List<TableRow> _buildTableRows({
    required BuildContext context,
    required List<MoveModel> moves,
    required bool isTableLevel,
  }) {
    return List.generate(moves.length, (index) {
      final move = moves[index];
      return TableRow(
        children: [
          _buildCell(
            isTableLevel &&
                    move.versionGroupDetailsModel![0].levelLearnedAt! > 1
                ? move.versionGroupDetailsModel![0].levelLearnedAt.toString()
                : isTableLevel &&
                        move.versionGroupDetailsModel![0].levelLearnedAt == 1
                    ? 'Init'
                    : isTableLevel &&
                            move.versionGroupDetailsModel![0].levelLearnedAt ==
                                0
                        ? 'Evo'
                        : isTableLevel == false
                            ? 'Mt'
                            : '',
            context,
            isSmalltext: true,
          ),
          _buildCell(
            capitalizeFirstLetter(move.move?.name ?? ''),
            context,
            isSmalltext: true,
          ),
          _buildCellType(
            capitalizeFirstLetter(move.type ?? ''),
            context,
          ),
          _buildCellCategory(move),
          _buildCell(
            move.power != null ? move.power.toString() : '-',
            context,
            isTextCenter: true,
            isWeight: true,
          ),
          _buildCell(
            move.accuracy != null ? move.accuracy.toString() : '-',
            context,
            isTextCenter: true,
            isWeight: true,
          ),
          _buildCell(
            move.pp != null ? move.pp.toString() : '-',
            context,
            isTextCenter: true,
            isWeight: true,
          ),
        ],
      );
    });
  }

  Widget _buildCell(
    String text,
    BuildContext context, {
    bool isWeight = false,
    Color? textColor,
    bool isTextCenter = false,
    bool isSmalltext = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
      child: Row(
        mainAxisAlignment:
            isTextCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          isSmalltext
              ? Expanded(
                  child: MyText.labelSmall(
                    context: context,
                    text: text,
                    isFontBold: isWeight,
                    color: textColor,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                )
              : Expanded(
                  child: MyText.labelMedium(
                    context: context,
                    text: text,
                    isFontBold: isWeight,
                    color: textColor,
                    textAlign: TextAlign.center,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ),
        ],
      ),
    );
  }

  Widget _buildCellType(
    String type,
    BuildContext context,
  ) {
    return Row(
      children: [
        TypePokemon(
          element: type,
          isBorder: false,
          isSmallText: true,
        ),
      ],
    );
  }

  Widget _buildCellCategory(
    MoveModel move,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: move.generateColorCategory,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
