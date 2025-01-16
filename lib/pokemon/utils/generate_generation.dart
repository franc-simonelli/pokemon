import 'package:pokedex/pokemon/models/pokemon_model.dart';

generateGeneration(
  List<PokemonModel> list,
  int start,
  int end,
  String gen,
  String region,
) async {
  List<PokemonModel> listPokemon = [];
  for (var i = start; i < end; i++) {
    listPokemon.add(list[i]);
  }
  return listPokemon;
}
