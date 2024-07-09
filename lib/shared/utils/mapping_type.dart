import 'package:pokedex/constants/image_constants.dart';

mappingType(type) {
  switch (type) {
    case 'Grass':
      return kTypeGrass;
    case 'Poison':
      return kTypePoison;
    case 'Fire':
      return kTypeFire;
    case 'Flying':
      return kTypeFlying;
    case 'Water':
      return kTypeWater;
    case 'Bug':
      return kTypeBug;
    case 'Normal':
      return kTypeNormal;
    case 'Electric':
      return kTypeEletric;
    case 'Ground':
      return kTypeGround;
    case 'Fairy':
      return kTypefairy;
    case 'Fighting':
      return kTypeFighting;
    case 'Psychic':
      return kTypePsychic;
    case 'Rock':
      return kTypeRock;
    case 'Ghost':
      return kTypeGhost;
    case 'Ice':
      return kTypeIce;
    case 'Dragon':
      return kTypeDragon;
    case 'Dark':
      return kTypeDark;
    case 'Steel':
      return kTypeSteel;
  }
}
