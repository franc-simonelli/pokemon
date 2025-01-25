import 'dart:collection';

generateWeaknessResistence({
  required List<String> doubleDamageFrom,
  required List<String> halfDamageFrom,
}) async {
  // Conta le occorrenze di ogni elemento in entrambe le liste
  var doubleCount = HashMap<String, int>();
  var halfCount = HashMap<String, int>();

  for (var tipo in doubleDamageFrom) {
    doubleCount[tipo] = (doubleCount[tipo] ?? 0) + 1;
  }

  for (var tipo in halfDamageFrom) {
    halfCount[tipo] = (halfCount[tipo] ?? 0) + 1;
  }

  // Bilancia le occorrenze
  for (var tipo in doubleCount.keys) {
    if (halfCount.containsKey(tipo)) {
      var differenza = doubleCount[tipo]!.compareTo(halfCount[tipo]!);

      if (differenza > 0) {
        doubleCount[tipo] = doubleCount[tipo]! - halfCount[tipo]!;
        halfCount[tipo] = 0;
      } else if (differenza < 0) {
        halfCount[tipo] = halfCount[tipo]! - doubleCount[tipo]!;
        doubleCount[tipo] = 0;
      } else {
        doubleCount[tipo] = 0;
        halfCount[tipo] = 0;
      }
    }
  }

  // Genera le liste finali rimuovendo le occorrenze a 0
  var finalDoubleDamageFrom = <String>[];
  doubleCount.forEach((tipo, count) {
    for (var i = 0; i < count; i++) {
      finalDoubleDamageFrom.add(tipo);
    }
  });

  var finalHalfDamageFrom = <String>[];
  halfCount.forEach((tipo, count) {
    for (var i = 0; i < count; i++) {
      finalHalfDamageFrom.add(tipo);
    }
  });

  return {
    "double_damage_from": finalDoubleDamageFrom,
    "half_damage_from": finalHalfDamageFrom,
  };
}
