// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

enum Status { initial, success, error, loading }

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({List<PokemonModel>? listMock})
      : super(PokemonState(
          downloadStatus: Status.initial,
          restorePokemonStatus: Status.initial,
          statusPagination: Status.initial,
          allPokemons: listMock ?? [],
          filterPokemon: listMock ?? [],
          pokemon1: [],
          pokemon2: [],
          pokemon3: [],
          pokemon4: [],
          pokemon5: [],
          pokemon6: [],
          pokemon7: [],
          filterText: '',
          filterTypes: [],
        ));

  static const _pageSize = 20;
  List<PokemonModel> _originalItems = [];

  Future<void> fetchPage(int pageKey) async {
    emit(state.copyWith(statusPagination: Status.loading));
    try {
      final newItems = await _fetchItems(pageKey, _pageSize);
      final isLastPage = newItems.length < _pageSize;
      _originalItems = _originalItems + newItems;

      if (isLastPage) {
        emit(state.copyWith(
          filterPokemon: newItems,
          isLastPage: true,
          statusPagination: Status.success,
        ));
      } else {
        emit(state.copyWith(
          filterPokemon: newItems,
          isLastPage: false,
          nextPageKey: pageKey + newItems.length,
          statusPagination: Status.success,
        ));
      }
      // final list = state.filterPokemon.toList();
    } catch (error) {
      emit(state.copyWith(statusPagination: Status.error));
    }
  }

  // void applyFilter(String query) {

  //     final filteredItems = _originalItems
  //         .where((item) => item.toLowerCase().contains(query.toLowerCase()))
  //         .toList();
  //     emit(ListLoaded(filteredItems, currentState.isLastPage, nextPageKey: currentState.nextPageKey));
  //   }
  // }

  Future<List<PokemonModel>> _fetchItems(int pageKey, int pageSize) async {
    await Future.delayed(const Duration(seconds: 2));
    List<PokemonModel> allPokemon = state.allPokemons.toList();
    List<PokemonModel> newItems = [];

    for (var i = pageKey - 1; i < (pageKey + pageSize); i++) {
      newItems.add(allPokemon[i]);
    }

    return newItems;
  }

  downloadPokemon() async {
    emit(state.copyWith(downloadStatus: Status.loading));
    try {
      final allPokemon = await pokemonRepository.downloadPokemon();
      final result1 = await createList(allPokemon, 0, 151, '1_gen', 'Kanto');
      final result2 = await createList(allPokemon, 151, 251, '2_gen', 'Johto');
      final result3 = await createList(allPokemon, 251, 386, '3_gen', 'Hoenn');
      final result4 = await createList(allPokemon, 386, 493, '4_gen', 'Sinnoh');
      final result5 = await createList(allPokemon, 493, 649, '5_gen', 'Unima');
      final result6 = await createList(allPokemon, 649, 721, '6_gen', 'Kalos');
      final result7 = await createList(allPokemon, 721, 809, '7_gen', 'Alola');

      final String encodedata1 = PokemonModel.encode(result1);
      final String encodedata2 = PokemonModel.encode(result2);
      final String encodedata3 = PokemonModel.encode(result3);
      final String encodedata4 = PokemonModel.encode(result4);
      final String encodedata5 = PokemonModel.encode(result5);
      final String encodedata6 = PokemonModel.encode(result6);
      final String encodedata7 = PokemonModel.encode(result7);

      await sharedPrefsService.setValue<String>(kGen1, encodedata1);
      await sharedPrefsService.setValue<String>(kGen2, encodedata2);
      await sharedPrefsService.setValue<String>(kGen3, encodedata3);
      await sharedPrefsService.setValue<String>(kGen4, encodedata4);
      await sharedPrefsService.setValue<String>(kGen5, encodedata5);
      await sharedPrefsService.setValue<String>(kGen6, encodedata6);
      await sharedPrefsService.setValue<String>(kGen7, encodedata7);

      emit(
        state.copyWith(
          allPokemons: result1 +
              result2 +
              result3 +
              result4 +
              result5 +
              result6 +
              result7,
          filterPokemon: result1 +
              result2 +
              result3 +
              result4 +
              result5 +
              result6 +
              result7,
          pokemon1: result1,
          pokemon2: result2,
          pokemon3: result3,
          pokemon4: result4,
          pokemon5: result5,
          pokemon6: result6,
          pokemon7: result7,
          downloadStatus: Status.success,
          restorePokemonStatus: Status.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(downloadStatus: Status.error));
    }
  }

  restorePokemon() async {
    emit(state.copyWith(restorePokemonStatus: Status.loading));
    final gen1 = await sharedPrefsService.getValue<String>(kGen1);
    List<PokemonModel> result1 = PokemonModel.decode(gen1!);
    final gen2 = await sharedPrefsService.getValue<String>(kGen2);
    List<PokemonModel> result2 = PokemonModel.decode(gen2!);
    final gen3 = await sharedPrefsService.getValue<String>(kGen3);
    List<PokemonModel> result3 = PokemonModel.decode(gen3!);
    final gen4 = await sharedPrefsService.getValue<String>(kGen4);
    List<PokemonModel> result4 = PokemonModel.decode(gen4!);
    emit(state.copyWith(
      allPokemons: result1 + result2 + result3 + result4,
      filterPokemon: result1 + result2 + result3 + result4,
      pokemon1: result1,
      pokemon2: result2,
      pokemon3: result3,
      pokemon4: result4,
    ));
    emit(state.copyWith(restorePokemonStatus: Status.success));
  }

  createList(list, start, end, gen, region) async {
    List<PokemonModel> listPokemon = [];
    for (var i = start; i < end; i++) {
      listPokemon.add(list[i]);
    }
    return listPokemon;
  }

  setNewItems(List<PokemonModel> newItem) async {
    emit(state.copyWith(filterPokemon: state.filterPokemon + newItem));
  }

  filterPokemonByText(String filter) async {
    List<PokemonModel> list = state.allPokemons.toList();
    if (filter != '' && state.filterTypes.isEmpty) {
      List<PokemonModel> listFilter = await filterByText(list, filter);
      emit(state.copyWith(filterPokemon: listFilter));
    }

    if (filter != '' && state.filterTypes.isNotEmpty) {
      List<PokemonModel> listFilter = await filterByText(list, filter);
      List<PokemonModel> listFilterWithTypes =
          await filterByType(listFilter, state.filterTypes);
      emit(state.copyWith(filterPokemon: listFilterWithTypes));
    }

    if (filter == '' && state.filterTypes.isEmpty) {
      emit(state.copyWith(filterPokemon: list));
    }

    if (filter == '' && state.filterTypes.isNotEmpty) {
      List<PokemonModel> listFilterWithTypes =
          await filterByType(list, state.filterTypes);
      emit(state.copyWith(filterPokemon: listFilterWithTypes));
    }
  }

  filterPokemonByType(List<String> types) async {
    emit(state.copyWith(filterTypes: types));
    List<PokemonModel> pokemons = state.allPokemons.toList();

    if (types.isEmpty && state.filterText == '') {
      emit(state.copyWith(filterPokemon: pokemons));
    }

    if (types.isEmpty && state.filterText != '') {
      List<PokemonModel> listFilter =
          await filterByText(pokemons, state.filterText);
      emit(state.copyWith(filterPokemon: listFilter));
    }

    if (types.isNotEmpty && state.filterText == '') {
      List<PokemonModel> listFilterWithTypes =
          await filterByType(pokemons, types);
      emit(state.copyWith(filterPokemon: listFilterWithTypes));
    }
    if (types.isNotEmpty && state.filterText != '') {
      List<PokemonModel> listFilter =
          await filterByText(pokemons, state.filterText);
      List<PokemonModel> listFilterWithTypes =
          await filterByType(listFilter, types);
      emit(state.copyWith(filterPokemon: listFilterWithTypes));
    }
  }

  filterByText(List<PokemonModel> pokemons, String filter) {
    List<PokemonModel> filterList = pokemons
        .where((i) => i.name!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    return filterList;
  }

  filterByType(List<PokemonModel> pokemons, List<String> types) async {
    List<PokemonModel> filter = [];
    types.forEach((type) {
      pokemons.forEach((pokemon) {
        if (pokemon.typeofpokemon!.contains(type)) {
          if (!filter.contains(pokemon)) {
            filter.add(pokemon);
          }
        }
      });
    });
    return filter;
  }
}
