import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';

import '../models/pokemon_model.dart';

savePokemonUpdate({
  required PokemonModel pokemon,
  required PokemonRepository pokemonRepository,
}) async {
  final id = int.parse(pokemon.id!.replaceAll("#", ""));
  List<PokemonModel> pokemons = [];
  String key = '';

  if (id > 0 && id <= 151) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.one);
    key = kGen1;
  } else if (id > 151 && id <= 251) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.two);
    key = kGen2;
  } else if (id > 251 && id <= 386) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.three);
    key = kGen3;
  } else if (id > 386 && id <= 493) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.four);
    key = kGen4;
  } else if (id > 493 && id <= 649) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.five);
    key = kGen5;
  } else if (id > 649 && id <= 721) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.six);
    key = kGen6;
  } else if (id > 721 && id <= 809) {
    pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.seven);
    key = kGen7;
  }

  final index = pokemons.indexWhere((element) => element.id == pokemon.id);
  pokemons.removeAt(index);
  pokemons.insert(index, pokemon);
  final String encodedata = PokemonModel.encode(pokemons);
  await sharedPrefsService.removeValue(key);
  await sharedPrefsService.setValue<String>(key, encodedata);
}
