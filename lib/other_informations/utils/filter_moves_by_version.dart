import 'package:pokedex/other_informations/models/move_model.dart';

filterScarletAndViolet(List<MoveModel> moves) async {
  List<MoveModel> moveLevelUp = [];
  List<MoveModel> moveMachine = [];
  if (moves.isNotEmpty) {
    for (var item in moves) {
      for (int i = 0; i < item.versionGroupDetailsModel!.length; i++) {
        final version = item.versionGroupDetailsModel?[i];
        if (version?.versionGroup?.name == 'scarlet-violet' &&
            version?.moveLearnMethod?.name == 'level-up') {
          MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
          moveUpdate.versionGroupDetailsModel?.add(version!);
          moveLevelUp.add(moveUpdate);
        }
        if (version?.versionGroup?.name == 'scarlet-violet' &&
            version?.moveLearnMethod?.name == 'machine') {
          MoveModel moveUpdate = item.copyWith(versionGroupDetailsModel: []);
          moveUpdate.versionGroupDetailsModel?.add(version!);
          moveMachine.add(moveUpdate);
        }
      }
    }
  }
  return {
    "levelUp": moveLevelUp,
    "machine": moveMachine,
  };
}
