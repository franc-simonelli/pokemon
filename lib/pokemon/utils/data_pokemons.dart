import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

generateAllData() async {
  final gen1 = await sharedPrefsService.getValue<String>(kGen1);
  List<PokemonModel> result1 = PokemonModel.decode(gen1!);

  final gen2 = await sharedPrefsService.getValue<String>(kGen2);
  List<PokemonModel> result2 = PokemonModel.decode(gen2!);

  final gen3 = await sharedPrefsService.getValue<String>(kGen3);
  List<PokemonModel> result3 = PokemonModel.decode(gen3!);

  final gen4 = await sharedPrefsService.getValue<String>(kGen4);
  List<PokemonModel> result4 = PokemonModel.decode(gen4!);

  final gen5 = await sharedPrefsService.getValue<String>(kGen5);
  List<PokemonModel> result5 = PokemonModel.decode(gen5!);

  final gen6 = await sharedPrefsService.getValue<String>(kGen6);
  List<PokemonModel> result6 = PokemonModel.decode(gen6!);

  final gen7 = await sharedPrefsService.getValue<String>(kGen7);
  List<PokemonModel> result7 = PokemonModel.decode(gen7!);

  return {
    "1_gen": result1,
    "2_gen": result2,
    "3_gen": result3,
    "4_gen": result4,
    "5_gen": result5,
    "6_gen": result6,
    "7_gen": result7,
  };
}

Future<List<PokemonModel>> generateAllDataPokemons() async {
  final gen1 = await sharedPrefsService.getValue<String>(kGen1);
  List<PokemonModel> result1 = PokemonModel.decode(gen1!);

  final gen2 = await sharedPrefsService.getValue<String>(kGen2);
  List<PokemonModel> result2 = PokemonModel.decode(gen2!);

  final gen3 = await sharedPrefsService.getValue<String>(kGen3);
  List<PokemonModel> result3 = PokemonModel.decode(gen3!);

  final gen4 = await sharedPrefsService.getValue<String>(kGen4);
  List<PokemonModel> result4 = PokemonModel.decode(gen4!);

  final gen5 = await sharedPrefsService.getValue<String>(kGen5);
  List<PokemonModel> result5 = PokemonModel.decode(gen5!);

  final gen6 = await sharedPrefsService.getValue<String>(kGen6);
  List<PokemonModel> result6 = PokemonModel.decode(gen6!);

  final gen7 = await sharedPrefsService.getValue<String>(kGen7);
  List<PokemonModel> result7 = PokemonModel.decode(gen7!);

  return result1 + result2 + result3 + result4 + result5 + result6 + result7;
}

Future<List<PokemonModel>> dataPagination(
  List<PokemonModel> list,
  int currentPage,
) async {
  int pageSize = 20;
  int startIndex = ((currentPage - 1) * pageSize);
  int endIndex = startIndex + pageSize;

  endIndex = endIndex > list.length ? list.length : endIndex;

  List<PokemonModel> paginationList = [];
  for (int i = startIndex; i < endIndex; i++) {
    paginationList.add(list[i]);
  }
  return paginationList;
}

List<PokemonModel> fetchFiltersPokemons({
  required List<String> typesFilter,
  required List<PokemonModel> pokemons,
  String? paramsFilter,
}) {
  List<PokemonModel> pokemonsFiltered = [];

  if (typesFilter.isEmpty) {
    pokemonsFiltered = pokemons;
  } else {
    for (var item in pokemons) {
      for (var filter in typesFilter) {
        if (item.typeofpokemon!.contains(filter)) {
          if (!pokemonsFiltered.contains(item)) {
            pokemonsFiltered.add(item);
          }
        }
      }
    }
  }

  if (paramsFilter != null && paramsFilter != '') {
    pokemonsFiltered
        .sort((a, b) => b.specialAttack!.compareTo(a.specialAttack!));
  }

  return pokemonsFiltered;
}

fetchFiltersPokemonsByText(
  String filter,
  List<PokemonModel> list,
) {
  return list
      .where((element) =>
          element.name!.toLowerCase().contains(filter.toLowerCase()))
      .toList();
}

filterPokemonById(String id) async {
  final list = await generateAllDataPokemons();
  return list.firstWhere((element) => element.id == id);
}

getPokemonByGen(String key) async {
  final gen = await sharedPrefsService.getValue<String>(key);
  List<PokemonModel> result = PokemonModel.decode(gen!);
  return result;
}
