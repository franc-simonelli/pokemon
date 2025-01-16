import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';

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
    emit(state.copyWith(pokemonStatus: Status.loading));
    logicDetailPokemon();
  }

  logicDetailPokemon() async {
    late PokemonModel pokemonUpdate;
    // prendo il pokemon aggiornato nello sharedP.
    final pokemon = await pokemonRepository
        .fetchPokemonById(state.pokemonSelected.id ?? '');

    // controllo se le stats sono gia state aggiornate
    final isUpdate = await checkStatsUpdate(pokemon);

    if (!isUpdate) {
      // se ancora non è stato aggiornato lo aggiorno
      pokemonUpdate = await fetchStatsPokemon(
        int.parse(state.pokemonSelected.id!.replaceAll("#", "")),
        state.pokemonSelected,
      );
      await savePokemonUpdate(pokemonUpdate);
    } else {
      pokemonUpdate = state.pokemonSelected;
    }

    // prendo la lista aggiornata e l'index del pokemon scelto
    final result = await pokemonRepository.fetchPokemonGen(gen);
    final indexInitial = result.indexWhere(
      (element) {
        if (element.id == pokemonSelected.id) {
          print(element);
        }
        return element.id == pokemonSelected.id;
      },
    );

    emit(state.copyWith(
      pokemonList: result,
      pokemonStatus: Status.success,
      initialIndex: indexInitial,
      pokemonSelected: pokemonUpdate,
    ));
  }

  fetchStatsPokemon(int id, PokemonModel pokemon) async {
    return await pokemonRepository.fetchPokemonStatsById(
      id,
      pokemon,
    );
  }

  savePokemonUpdate(PokemonModel pokemonUpdate) async {
    final id = int.parse(pokemonUpdate.id!.replaceAll("#", ""));
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

    final index =
        pokemons.indexWhere((element) => element.id == pokemonUpdate.id);
    pokemons.removeAt(index);
    pokemons.insert(index, pokemonUpdate);
    final String encodedata = PokemonModel.encode(pokemons);
    print(encodedata);
    await sharedPrefsService.removeValue(key);
    await sharedPrefsService.setValue<String>(key, encodedata);
  }

  checkStatsUpdate(PokemonModel checkPokemon) async {
    final pokemons = await pokemonRepository.fetchPokemonGen(EnumGen.all);
    final pokemon =
        pokemons.firstWhere((element) => element.id == checkPokemon.id);
    return pokemon.statsUpdate ?? false;
  }

  changePokemon(PokemonModel pokemon) {
    if (pokemon.id == state.pokemonSelected.id) return;
    emit(state.copyWith(pokemonSelected: pokemon));
    logicDetailPokemon();
  }
}
