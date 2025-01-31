import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';

part 'stats_pokemon_state.dart';
part 'stats_pokemon_cubit.freezed.dart';

class StatsPokemonCubit extends Cubit<StatsPokemonState> {
  StatsPokemonCubit() : super(StatsPokemonState(level: 1, showLvSlider: false));

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
  }

  calculateStat(int baseStat, int level) {
    double value = ((baseStat * 2) * (level / 100)) + 5;
    return value.toInt();
  }

  calculateStatHp(int baseStat, int level) {
    double value = ((baseStat * 2) * (level / 100)) + level + 10;
    return value.toInt();
  }
}
