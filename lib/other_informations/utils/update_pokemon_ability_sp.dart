import 'package:pokedex/other_informations/models/ability_model.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';

updatePokemonAbilitySP({
  required AbilityModel ability,
  required PokemonModel pokemon,
  required PokemonRepository pokemonRepository,
}) async {
  final pokemonBySP = await pokemonRepository.fetchPokemonById(
    pokemon.id ?? '',
  );
  final index = pokemonBySP.moveset?.abilities?.indexWhere(
    (element) {
      return element.ability?.name == ability.ability?.name;
    },
  );
  pokemonBySP.moveset?.abilities?.removeAt(index!);
  pokemonBySP.moveset?.abilities?.insert(index!, ability);
  await savePokemonUpdate(
    pokemon: pokemonBySP,
    pokemonRepository: pokemonRepository,
  );
}
