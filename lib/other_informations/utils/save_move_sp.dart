import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/other_informations/models/move_model.dart';

saveMoveSP(MoveModel move) async {
  List<MoveModel> moves = [];
  final moveJson = await sharedPrefsService.getValue<String>(kMoves) ?? '';
  if (moveJson != '') {
    moves = MoveModel.decode(moveJson);
    moves.add(move);
  } else {
    moves.add(move);
  }
  String encode = MoveModel.encode(moves);
  await sharedPrefsService.removeValue(kMoves);
  await sharedPrefsService.setValue(kMoves, encode);
}
