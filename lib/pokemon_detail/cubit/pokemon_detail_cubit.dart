import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/utils/save_pokemon_storage.dart';
part 'pokemon_detail_state.dart';
part 'pokemon_detail_cubit.freezed.dart';

enum EnumPage { back, forward }

enum EnumGen {
  none,
  all,
  one,
  two,
  three,
  four,
  five,
  six,
  seven;

  String get getKey {
    switch (this) {
      case none:
        return '';
      case all:
        return '';
      case one:
        return kGen1;
      case two:
        return kGen2;
      case three:
        return kGen3;
      case four:
        return kGen4;
      case five:
        return kGen5;
      case six:
        return kGen6;
      case seven:
        return kGen7;
      default:
        return '';
    }
  }
}

class PokemonDetailCubit extends Cubit<PokemonDetailState> {
  PokemonDetailCubit({
    required this.pokemonSelected,
    required this.gen,
    required this.pokemonRepository,
  }) : super(PokemonDetailState(
          pokemonSelected: pokemonSelected,
          gen: gen,
          pokemonList: [],
          pokemonStatus: Status.initial,
        )) {
    initialize();
  }
  final PokemonModel pokemonSelected;
  final EnumGen gen;
  final PokemonRepository pokemonRepository;

  initialize() async {
    if (gen == EnumGen.none) return;

    final pokemonsList = await pokemonRepository.fetchPokemonGen(gen);
    final indexInitial = pokemonsList.indexWhere(
      (element) {
        if (element.id == pokemonSelected.id) {}
        return element.id == pokemonSelected.id;
      },
    );

    // se il pokemon selezionato ha gia le statistiche aggiornate
    if (pokemonSelected.statsUpdate == true) {
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
      ));
      return;
    }

    // se il pokemon selecionato non ha le statistiche aggiornate
    // faccio prima una verifica nell SP
    final pokemonById =
        await pokemonRepository.fetchPokemonById(pokemonSelected.id ?? '');
    if (pokemonById.statsUpdate == true) {
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
        pokemonSelected: pokemonById,
      ));
    } else {
      emit(state.copyWith(
        pokemonList: pokemonsList,
        initialIndex: indexInitial,
      ));

      // aggiorno il pokemon con le statistiche
      final pokemonUpdate = await updateStats(pokemonById);
      final updateList = await updateLocalList(pokemonUpdate);
      emit(state.copyWith(
        pokemonList: updateList,
        initialIndex: indexInitial,
        pokemonSelected: pokemonUpdate,
      ));
    }
  }

  changePokemon(PokemonModel pokemon) async {
    if (pokemon.id == state.pokemonSelected.id) return;
    emit(state.copyWith(
      pokemonSelected: pokemon,
    ));
    if (pokemon.statsUpdate != true) {
      final pokemonUpdate = await updateStats(pokemon);
      final updateList = await updateLocalList(pokemonUpdate);
      emit(state.copyWith(
        pokemonList: updateList,
        pokemonSelected: pokemonUpdate,
      ));
    }
  }

  updateLocalList(PokemonModel pokemon) async {
    final currentList = state.pokemonList.toList();
    final index = currentList.indexWhere(
      (element) {
        return element.id == pokemon.id;
      },
    );
    currentList.removeAt(index);
    currentList.insert(index, pokemon);
    return currentList;
  }

  updateStats(PokemonModel pokemon) async {
    final pokemonUpdate = await fetchStatsPokemon(
      int.parse(pokemon.id!.replaceAll("#", "")),
      pokemon,
    );
    await savePokemonUpdate(
      pokemon: pokemonUpdate,
      pokemonRepository: pokemonRepository,
    );
    return pokemonUpdate;
  }

  // logicDetailPokemon() async {
  //   late PokemonModel pokemonUpdate;
  //   final pokemon = await pokemonRepository
  //       .fetchPokemonById(state.pokemonSelected.id ?? '');
  //   final isUpdate = await checkStatsUpdate(pokemon);
  //   if (!isUpdate) {
  //     pokemonUpdate = await fetchStatsPokemon(
  //       int.parse(pokemon.id!.replaceAll("#", "")),
  //       pokemon,
  //     );
  //     await savePokemonUpdate(
  //       pokemon: pokemonUpdate,
  //       pokemonRepository: pokemonRepository,
  //     );
  //   } else {
  //     pokemonUpdate = pokemon;
  //   }
  //   final result = await pokemonRepository.fetchPokemonGen(gen);
  //   final indexInitial = result.indexWhere(
  //     (element) {
  //       if (element.id == pokemonSelected.id) {}
  //       return element.id == pokemonSelected.id;
  //     },
  //   );
  //   emit(state.copyWith(
  //     pokemonList: result,
  //     pokemonStatus: Status.success,
  //     initialIndex: indexInitial,
  //     pokemonSelected: pokemonUpdate,
  //   ));
  // }

  fetchStatsPokemon(int id, PokemonModel pokemon) async {
    return await pokemonRepository.fetchPokemonStatsById(
      id,
      pokemon,
    );
  }

  // checkStatsUpdate(PokemonModel checkPokemon) async {
  //   final pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.all);
  //   final pokemon =
  //       pokemons.firstWhere((element) => element.id == checkPokemon.id);
  //   return pokemon.statsUpdate ?? false;
  // }
}
