import 'package:collection/collection.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/other_informations/models/move_model.dart';

checkMoveSP(MoveModel move) async {
  final moveJson = await sharedPrefsService.getValue<String>(kMoves) ?? '';
  if (moveJson != '') {
    List<MoveModel> moves = MoveModel.decode(moveJson);
    return moves.firstWhereOrNull(
      (element) {
        return element.id == move.id;
      },
    );
  }
}
