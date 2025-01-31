import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/stats_pokemon/models/stats_value_model.dart';

generateStats(PokemonModel pokemon) {
  return StatsValueModel(
    hp: pokemon.hp ?? 0,
    attack: pokemon.attack ?? 0,
    defense: pokemon.defense ?? 0,
    specialAttack: pokemon.specialAttack ?? 0,
    specialDefense: pokemon.specialDefense ?? 0,
    speed: pokemon.speed ?? 0,
    total: pokemon.total ?? 0,
  );
}
