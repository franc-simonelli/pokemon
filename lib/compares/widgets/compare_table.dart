import 'package:flutter/material.dart';
import 'package:pokedex/compares/widgets/table_stats.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';

class CompareTable extends StatelessWidget {
  const CompareTable({
    this.firstName,
    this.secondName,
    this.firstStats,
    this.secondStats,
    super.key,
  });

  final String? firstName;
  final String? secondName;
  final StatsValueModel? firstStats;
  final StatsValueModel? secondStats;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TableStats(
        firstName: firstName ?? '',
        secondName: secondName ?? '',
        statsFirst: [
          firstStats?.hp ?? 0,
          firstStats?.attack ?? 0,
          firstStats?.defense ?? 0,
          firstStats?.specialAttack ?? 0,
          firstStats?.specialDefense ?? 0,
          firstStats?.speed ?? 0,
          firstStats?.total ?? 0,
        ],
        statsSecond: [
          secondStats?.hp ?? 0,
          secondStats?.attack ?? 0,
          secondStats?.defense ?? 0,
          secondStats?.specialAttack ?? 0,
          secondStats?.specialDefense ?? 0,
          secondStats?.speed ?? 0,
          secondStats?.total ?? 0,
        ],
      ),
    );
  }
}
