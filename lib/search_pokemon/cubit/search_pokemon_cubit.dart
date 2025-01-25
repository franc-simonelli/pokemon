import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
part 'search_pokemon_state.dart';
part 'search_pokemon_cubit.freezed.dart';

class SearchPokemonCubit extends Cubit<SearchPokemonState> {
  SearchPokemonCubit({
    required this.pokemonRepository,
  }) : super(
          SearchPokemonState(
            chronology: [],
            pokemons: [],
            chronologyStatus: Status.initial,
            pokemonsStatus: Status.initial,
          ),
        ) {
    initializeChronology();
  }

  final PokemonRepository pokemonRepository;

  initializeChronology() async {
    // await sharedPrefsService.removeValue(kChronology);
    emit(state.copyWith(chronologyStatus: Status.loading));
    final chronologyJson =
        await sharedPrefsService.getValue<String>(kChronology);
    if (chronologyJson != null) {
      List<PokemonModel> chronology = PokemonModel.decode(chronologyJson);
      emit(state.copyWith(
        chronologyStatus: Status.success,
        chronology: chronology,
      ));
    } else {
      emit(state.copyWith(chronologyStatus: Status.success));
    }
  }

  filterPokemons(String value) async {
    try {
      if (value == '') {
        emit(state.copyWith(
          pokemonsStatus: Status.initial,
          pokemons: [],
        ));
      } else {
        emit(state.copyWith(pokemonsStatus: Status.loading, filterText: value));
        final pokemons = await pokemonRepository.filtersPokemonsByText(value);
        emit(state.copyWith(
          pokemonsStatus: Status.success,
          pokemons: pokemons,
        ));
      }
    } catch (e) {
      emit(state.copyWith(
        pokemonsStatus: Status.error,
        pokemons: state.pokemons,
      ));
    }
  }

  manageChronology(PokemonModel pokemon) async {
    List<PokemonModel> chronology = [];
    final chronologyJson =
        await sharedPrefsService.getValue<String>(kChronology) ?? '';

    if (chronologyJson == '') {
      chronology.add(pokemon);
      chronology.reversed.toList();
      saveChronology(chronology);
    } else {
      chronology = PokemonModel.decode(chronologyJson);
      bool isExist = chronology.any((element) => element.id == pokemon.id);
      if (!isExist) {
        chronology.insert(0, pokemon);
        saveChronology(chronology);
      }
    }
    initializeChronology();
  }

  saveChronology(List<PokemonModel> chronology) async {
    final chronologyEncode = PokemonModel.encode(chronology);
    await sharedPrefsService.setValue(kChronology, chronologyEncode);
  }

  deleteItemChronology(PokemonModel pokemon) async {
    List<PokemonModel> chronology = [];
    final chronologyJson =
        await sharedPrefsService.getValue<String>(kChronology) ?? '';
    chronology = PokemonModel.decode(chronologyJson);

    final item = chronology.firstWhere(
      (element) => element.id == pokemon.id,
    );
    chronology.remove(item);
    saveChronology(chronology);
    initializeChronology();
  }
}
