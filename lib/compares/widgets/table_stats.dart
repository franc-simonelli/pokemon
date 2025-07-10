import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class TableStats extends StatelessWidget {
  TableStats({
    required this.firstName,
    required this.secondName,
    required this.statsFirst,
    required this.statsSecond,
    super.key,
  });

  final List<String> stats = [
    "HP",
    "Attack",
    "Defense",
    "Sp. Atk",
    "Sp. Def",
    "Speed",
    "Total"
  ];
  final String firstName;
  final String secondName;
  final List<int> statsFirst;
  final List<int> statsSecond;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
        horizontalInside: BorderSide(color: Colors.grey.shade800, width: 1),
        verticalInside: BorderSide(color: Colors.grey.shade800, width: 1),
      ),
      columnWidths: const {
        0: FlexColumnWidth(3), // Stat Name
        1: FlexColumnWidth(3), // Stat
        2: FlexColumnWidth(3), // Stat
        3: FlexColumnWidth(2), // Difference
      },
      children: [
        _buildTableHeader(context),
        ..._buildTableRows(context),
      ],
    );
  }

  TableRow _buildTableHeader(BuildContext context) {
    return TableRow(
      children: [
        _buildCell("Stat", context, isHeader: true),
        _buildCell(firstName, context, isHeader: true),
        _buildCell(secondName, context, isHeader: true),
        _buildCell("Diff", context, isHeader: true),
      ],
    );
  }

  List<TableRow> _buildTableRows(BuildContext context) {
    return List.generate(stats.length, (index) {
      final int difference = statsFirst[index] - statsSecond[index];
      return TableRow(
        children: [
          _buildCell(stats[index], context),
          _buildCell(statsFirst[index].toString(), context),
          _buildCell(statsSecond[index].toString(), context),
          _buildCell(
            difference > 0 ? "+$difference" : difference.toString(),
            context,
            textColor: difference > 0
                ? Colors.green
                : (difference < 0 ? Colors.red : Colors.grey),
          ),
        ],
      );
    });
  }

  Widget _buildCell(
    String text,
    BuildContext context, {
    bool isHeader = false,
    Color? textColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: MyText.labelMedium(
        context: context,
        text: text,
        isFontBold: isHeader,
        color: textColor,
        textAlign: TextAlign.center,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
