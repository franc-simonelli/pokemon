import 'package:pokedex/pokemon/utils/data_pokemons.dart';

class FiltersRepository {
  Future<List<String>> fetchFilters() async {
    final pokemons = await generateAllDataPokemons();
    List<String> allTypes = [];
    pokemons.forEach((element) {
      element.typeofpokemon!.forEach((type) {
        allTypes.add(type);
      });
    });
    final listUnique = allTypes.toSet().toList();
    return listUnique;
  }
}
