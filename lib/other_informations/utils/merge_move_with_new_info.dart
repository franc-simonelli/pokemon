import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';

mergeMoveWithNewInfo({
  required MoveModel previusMove,
  required MoveModel moveWithNewInfo,
}) {
  return previusMove.copyWith(
    move: previusMove.move?.copyWith(name: moveWithNewInfo.move?.name ?? ''),
    isDownloaded: moveWithNewInfo.isDownloaded,
    accuracy: moveWithNewInfo.accuracy,
    power: moveWithNewInfo.power,
    pp: moveWithNewInfo.pp,
    priority: moveWithNewInfo.priority,
    damageClass: moveWithNewInfo.damageClass,
    type: moveWithNewInfo.type,
    effectEntries: EffectModel(
      effect: moveWithNewInfo.effectEntries?.effect,
      shortEffect: moveWithNewInfo.effectEntries?.shortEffect,
    ),
  );
}
