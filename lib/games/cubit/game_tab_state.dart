part of 'game_tab_cubit.dart';

@freezed
class GameTabState with _$GameTabState {
  const factory GameTabState({
    required List<String> games,
    required Status gamesStatus,
    required String gameSelected,
  }) = _GameTabState;
}
