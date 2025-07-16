// ignore_for_file: empty_catches

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/utils/filter_moves_by_version.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

part 'game_tab_state.dart';
part 'game_tab_cubit.freezed.dart';

class GameTabCubit extends Cubit<GameTabState> {
  GameTabCubit()
      : super(
          GameTabState(
            games: [],
            gamesStatus: Status.initial,
            gameSelected: '',
          ),
        ) {}

  fetchGames(List<MoveModel> moveset) async {
    try {
      emit(state.copyWith(gamesStatus: Status.loading));
      final games = await groupByGame(moveset);
      emit(state.copyWith(
        games: games,
        gamesStatus: Status.success,
        gameSelected: games.isNotEmpty ? games[0] : '',
      ));
    } catch (e) {}
  }

  changeGameSelected(String game) {
    emit(state.copyWith(gameSelected: game));
  }
}
