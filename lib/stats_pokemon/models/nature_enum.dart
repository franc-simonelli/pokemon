import 'package:pokedex/stats_pokemon/models/stats_enum.dart';

enum Nature {
  none,
  allegra,
  ardente,
  ardita,
  audace,
  birbona,
  calma,
  cauta,
  decisa,
  docile,
  fiacca,
  furba,
  gentile,
  ingenua,
  lesta,
  mite,
  modesta,
  placida,
  quieta,
  ritrosa,
  scaltra,
  schiva,
  seria,
  sicura,
  timida,
  vivace;

  String getDesc() {
    if (this == Nature.none) return 'Select nature';
    String name = toString().split('.').last;
    return name[0].toUpperCase() + name.substring(1);
  }

  Stats getStatUp() {
    switch (this) {
      case Nature.audace:
      case Nature.birbona:
      case Nature.decisa:
      case Nature.schiva:
        return Stats.attack;
      case Nature.fiacca:
      case Nature.placida:
      case Nature.scaltra:
      case Nature.sicura:
        return Stats.defense;
      case Nature.ardente:
      case Nature.mite:
      case Nature.modesta:
      case Nature.quieta:
        return Stats.specialAttack;
      case Nature.calma:
      case Nature.cauta:
      case Nature.gentile:
      case Nature.vivace:
        return Stats.specialDefense;
      case Nature.allegra:
      case Nature.ingenua:
      case Nature.lesta:
      case Nature.timida:
        return Stats.speed;
      default:
        return Stats.none;
    }
  }

  Stats getStatDown() {
    switch (this) {
      case Nature.calma:
      case Nature.modesta:
      case Nature.sicura:
      case Nature.timida:
        return Stats.attack;
      case Nature.gentile:
      case Nature.lesta:
      case Nature.mite:
      case Nature.schiva:
        return Stats.defense;
      case Nature.allegra:
      case Nature.cauta:
      case Nature.decisa:
      case Nature.scaltra:
        return Stats.specialAttack;
      case Nature.ardente:
      case Nature.birbona:
      case Nature.fiacca:
      case Nature.ingenua:
        return Stats.specialDefense;
      case Nature.audace:
      case Nature.placida:
      case Nature.quieta:
      case Nature.vivace:
        return Stats.speed;
      default:
        return Stats.none;
    }
  }
}
