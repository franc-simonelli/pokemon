import 'package:pokedex/constants/image_constants.dart';

mappingType(String type) {
  final typeLower = type.toLowerCase();
  switch (typeLower) {
    case 'grass':
      return kTypeGrass;
    case 'poison':
      return kTypePoison;
    case 'fire':
      return kTypeFire;
    case 'flying':
      return kTypeFlying;
    case 'water':
      return kTypeWater;
    case 'bug':
      return kTypeBug;
    case 'normal':
      return kTypeNormal;
    case 'electric':
      return kTypeEletric;
    case 'ground':
      return kTypeGround;
    case 'fairy':
      return kTypefairy;
    case 'fighting':
      return kTypeFighting;
    case 'psychic':
      return kTypePsychic;
    case 'rock':
      return kTypeRock;
    case 'ghost':
      return kTypeGhost;
    case 'ice':
      return kTypeIce;
    case 'dragon':
      return kTypeDragon;
    case 'dark':
      return kTypeDark;
    case 'steel':
      return kTypeSteel;
  }
}
