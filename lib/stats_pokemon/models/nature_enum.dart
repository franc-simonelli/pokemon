enum PokemonNature {
  audace,
  decisa,
  schiva,
  allegra,
  ardita,
  scaltra,
  fiacca,
  placida,
  timida,
  lesta,
  gioiosa,
  ingenua,
  modesta,
  mite,
  docile,
  calma,
  gentile,
  vivace,
  seria;

  String getDesc() {
    String name = toString().split('.').last;
    return name[0].toUpperCase() + name.substring(1);
  }
}
