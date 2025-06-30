import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/stats_pokemon/models/nature_enum.dart';
import 'package:pokedex/stats_pokemon/models/stats_enum.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';

part 'stats_pokemon_state.dart';
part 'stats_pokemon_cubit.freezed.dart';

class StatsPokemonCubit extends Cubit<StatsPokemonState> {
  StatsPokemonCubit()
      : super(
          StatsPokemonState(
            level: 1,
            showLvSlider: false,
            nature: Nature.none,
          ),
        );

  initialize({
    required PokemonModel pokemon,
    StatsValueModel? stats,
  }) {
    emit(state.copyWith(
      pokemon: pokemon,
      stats: stats,
      statsBase: stats,
    ));
    if (state.showLvSlider) {
      manageStatsByLv(state.level);
    }
  }

  showLvSlider() {
    emit(state.copyWith(showLvSlider: !state.showLvSlider));
    if (state.showLvSlider) {
      manageStatsByLv(state.level);
    } else {
      emit(state.copyWith(stats: state.statsBase));
      if (state.nature != Nature.none) {
        changeNature(state.nature);
      }
    }
  }

  manageStatsByLv(int level) {
    if (level > 100 || level < 1) return;
    StatsValueModel? stats = state.stats?.copyWith(
      hp: calculateStatHp(state.pokemon!.hp!, level),
      attack: calculateStat(state.pokemon!.attack!, level),
      defense: calculateStat(state.pokemon!.defense!, level),
      specialAttack: calculateStat(state.pokemon!.specialAttack!, level),
      specialDefense: calculateStat(state.pokemon!.specialDefense!, level),
      speed: calculateStat(state.pokemon!.speed!, level),
    );
    stats?.total = stats.hp +
        stats.attack +
        stats.defense +
        stats.specialAttack +
        stats.specialDefense +
        stats.speed;
    emit(state.copyWith(stats: stats, level: level));

    if (state.nature != Nature.none) {
      changeNature(state.nature);
    }
  }

  calculateStat(int baseStat, int level) {
    double value = ((baseStat * 2) * (level / 100)) + 5;
    return value.toInt();
  }

  calculateStatHp(int baseStat, int level) {
    double value = ((baseStat * 2) * (level / 100)) + level + 10;
    return value.toInt();
  }

  int calculateNature(int stat) {
    double value = (stat * 10) / 100;
    return roundToNearest(value);
  }

  int roundToNearest(double value) {
    return value >= value.toInt() + 0.5 ? value.toInt() + 1 : value.toInt();
  }

  changeNature(Nature nature) {
    StatsValueModel? stats;

    if (nature.getStatUp() == Stats.none) {
      emit(state.copyWith(nature: Nature.none));
      manageStatsByLv(state.level);
      return;
    } else if (nature.getStatUp() == Stats.hp) {
      stats = state.stats
          ?.copyWith(hp: state.stats!.hp + calculateNature(state.stats!.hp));
    } else if (nature.getStatUp() == Stats.attack) {
      stats = state.stats?.copyWith(
          attack: state.stats!.attack + calculateNature(state.stats!.attack));
    } else if (nature.getStatUp() == Stats.defense) {
      stats = state.stats?.copyWith(
          defense:
              state.stats!.defense + calculateNature(state.stats!.defense));
    } else if (nature.getStatUp() == Stats.specialAttack) {
      stats = state.stats?.copyWith(
          specialAttack: state.stats!.specialAttack +
              calculateNature(state.stats!.specialAttack));
    } else if (nature.getStatUp() == Stats.specialDefense) {
      stats = state.stats?.copyWith(
          specialDefense: state.stats!.specialDefense +
              calculateNature(state.stats!.specialDefense));
    } else if (nature.getStatUp() == Stats.speed) {
      stats = state.stats?.copyWith(
          speed: state.stats!.speed + calculateNature(state.stats!.speed));
    }

    if (nature.getStatDown() == Stats.hp) {
      stats = stats?.copyWith(hp: stats.hp - calculateNature(stats.hp));
    } else if (nature.getStatDown() == Stats.attack) {
      stats =
          stats?.copyWith(attack: stats.attack - calculateNature(stats.attack));
    } else if (nature.getStatDown() == Stats.defense) {
      stats = stats?.copyWith(
          defense: stats.defense - calculateNature(stats.defense));
    } else if (nature.getStatDown() == Stats.specialAttack) {
      stats = stats?.copyWith(
          specialAttack:
              stats.specialAttack - calculateNature(stats.specialAttack));
    } else if (nature.getStatDown() == Stats.specialDefense) {
      stats = stats?.copyWith(
          specialDefense:
              stats.specialDefense - calculateNature(stats.specialDefense));
    } else if (nature.getStatDown() == Stats.speed) {
      stats =
          stats?.copyWith(speed: stats.speed - calculateNature(stats.speed));
    }

    emit(
      state.copyWith(
        nature: nature,
        stats: stats?.copyWith(
            total: stats.hp +
                stats.attack +
                stats.defense +
                stats.specialAttack +
                stats.specialDefense +
                stats.speed),
      ),
    );
  }
}
