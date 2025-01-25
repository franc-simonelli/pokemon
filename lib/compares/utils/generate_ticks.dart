generateTicks(List<int> values) {
  int massimo = values[0]; // Partiamo dal primo elemento

  for (int numero in values) {
    if (numero > massimo) {
      massimo = numero;
    }
  }

  return dividiInPorzioni(massimo);
}

List<int> dividiInPorzioni(int numero) {
  List<int> porzioni = [];

  int incremento = (numero / 4).floor();

  for (int i = 1; i <= 3; i++) {
    porzioni.add(incremento * i);
  }

  porzioni.add(numero);
  return porzioni;
}
