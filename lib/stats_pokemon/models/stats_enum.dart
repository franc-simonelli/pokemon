enum Stats {
  none,
  hp,
  attack,
  defense,
  specialAttack,
  specialDefense,
  speed;

  String getDesc() {
    switch (this) {
      case Stats.none:
        return '-';
      case Stats.hp:
        return 'Hp';
      case Stats.attack:
        return 'Atk';
      case Stats.defense:
        return 'Def';
      case Stats.specialAttack:
        return 'Spc. Atk';
      case Stats.specialDefense:
        return 'Spc. Def';
      case Stats.speed:
        return 'Spe';
    }
  }
}
