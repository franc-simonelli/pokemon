// ignore_for_file: unused_local_variable

import 'package:pokedex/other_informations/models/move_model.dart';

orderMoves(List<MoveModel> moves, String type) async {
  List<MoveModel> orderMoves = [];
  List<MoveModel> prioritari =
      moves.where((p) => p.type == type.toLowerCase()).toList();
  List<MoveModel> restanti =
      moves.where((p) => p.type != type.toLowerCase()).toList();

  // Raggruppa i restanti per elemento
  Map<String, List<MoveModel>> raggruppati = {};
  for (var p in restanti) {
    raggruppati.putIfAbsent(p.type!, () => []).add(p);
  }

  // Concatena la lista ordinata
  return orderMoves = [
    ...prioritari,
    ...raggruppati.values
        .expand((x) => x) // Espande le liste raggruppate in sequenza
  ];
}
