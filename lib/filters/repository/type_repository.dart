import 'package:pokedex/pokemon/utils/data_pokemons.dart';

class FiltersRepository {
  Future<List<String>> fetchFilters() async {
    final pokemons = await generateAllDataPokemons();
    List<String> allTypes = [];
    for (var element in pokemons) {
      for (var type in element.typeofpokemon!) {
        allTypes.add(type);
      }
    }
    final listUnique = allTypes.toSet().toList();
    return listUnique;
  }
}
