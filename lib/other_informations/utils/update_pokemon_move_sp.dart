import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';

updatePokemonMoveSP({
  required MoveModel move,
  required PokemonModel pokemon,
  required PokemonRepository pokemonRepository,
}) async {
  final pokemonBySP = await pokemonRepository.fetchPokemonById(
    pokemon.id ?? '',
  );
  final index = pokemonBySP.moveset?.moves?.indexWhere(
    (element) {
      if (element.id == move.id) {}
      return element.id == move.id;
    },
  );

  pokemonBySP.moveset?.moves?.removeAt(index!);
  pokemonBySP.moveset?.moves?.insert(index!, move);
  await savePokemonUpdate(
    pokemon: pokemonBySP,
    pokemonRepository: pokemonRepository,
  );
}
