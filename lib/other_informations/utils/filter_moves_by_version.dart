import 'package:pokedex/other_informations/models/move_model.dart';

groupByGame(List<MoveModel> moves) {
  final Set<String> gameNames = {};

  for (var move in moves) {
    final details = move.versionGroupDetailsModel ?? [];
    for (var detail in details) {
      final name = detail.versionGroup?.name;
      if (name != null) {
        gameNames.add(name);
      }
    }
  }

  return gameNames.toList();
}

filterMovesByGame(List<MoveModel> moves, String game) {
  List<MoveModel> moveLevelUp = [];
  List<MoveModel> moveMachine = [];
  List<MoveModel> moveEgg = [];

  for (var item in moves) {
    for (int i = 0; i < item.versionGroupDetailsModel!.length; i++) {
      final version = item.versionGroupDetailsModel?[i];
      // print('NAME GAME: ${version?.versionGroup?.name}');
      // print('TYPE: ${version?.moveLearnMethod?.name}');
      if (version?.versionGroup?.name == game &&
          version?.moveLearnMethod?.name == 'level-up') {
        MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
        moveUpdate.versionGroupDetailsModel?.add(version!);
        moveLevelUp.add(moveUpdate);
      }
      if (version?.versionGroup?.name == game &&
          version?.moveLearnMethod?.name == 'machine') {
        MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
        moveUpdate.versionGroupDetailsModel?.add(version!);
        moveMachine.add(moveUpdate);
      }
      if (version?.versionGroup?.name == game &&
          version?.moveLearnMethod?.name == 'egg') {
        MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
        moveUpdate.versionGroupDetailsModel?.add(version!);
        moveEgg.add(moveUpdate);
      }
    }
  }
  return {
    "levelUp": moveLevelUp,
    "machine": moveMachine,
    "egg": moveEgg,
  };
}

// filterScarletAndViolet(List<MoveModel> moves) async {
//   List<MoveModel> moveLevelUp = [];
//   List<MoveModel> moveMachine = [];
//   if (moves.isNotEmpty) {
//     for (var item in moves) {
//       for (int i = 0; i < item.versionGroupDetailsModel!.length; i++) {
//         final version = item.versionGroupDetailsModel?[i];
//         print('NAME GAME: ${version?.versionGroup?.name}');
//         print('TYPE: ${version?.moveLearnMethod?.name}');
//         if (version?.versionGroup?.name == 'scarlet-violet' &&
//             version?.moveLearnMethod?.name == 'level-up') {
//           MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
//           moveUpdate.versionGroupDetailsModel?.add(version!);
//           moveLevelUp.add(moveUpdate);
//         }
//         if (version?.versionGroup?.name == 'scarlet-violet' &&
//             version?.moveLearnMethod?.name == 'machine') {
//           MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
//           moveUpdate.versionGroupDetailsModel?.add(version!);
//           moveMachine.add(moveUpdate);
//         }
//       }
//     }
//   }
//   return {
//     "levelUp": moveLevelUp,
//     "machine": moveMachine,
//   };
// }
