part of 'compares_cubit.dart';

@freezed
class ComparesState with _$ComparesState {
  const factory ComparesState({
    required List<PokemonModel> pokemons,
    PokemonModel? firstPokemonSelected,
    PokemonModel? secondPokemonSelected,
  }) = _ComparesState;

  const ComparesState._();

  //  prima lista primo pokemon
  bool get firstListFirstPokemon {
    final index = pokemons
        .indexWhere((element) => element.id == firstPokemonSelected?.id);
    return index == 0;
  }

  // prima lista ultimo pokemon
  bool get firstListLastPokemon {
    final index = pokemons
        .indexWhere((element) => element.id == firstPokemonSelected?.id);
    return index == pokemons.length - 1;
  }

  // seconda lista primo pokeon
  bool get secondListFirstPokemon {
    final index = pokemons
        .indexWhere((element) => element.id == secondPokemonSelected?.id);
    return index == 0;
  }

  // seconda lista ultimo pokemon
  bool get secondListLastPokemon {
    final index = pokemons
        .indexWhere((element) => element.id == secondPokemonSelected?.id);
    return index == pokemons.length - 1;
  }
}
