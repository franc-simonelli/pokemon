// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/pokemon/utils/data_pokemons.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

enum Status { initial, success, error, loading }

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({
    required this.pokemonRepository,
    required this.filtersCubit,
    required this.gen,
  }) : super(
          PokemonState(
            listPokemons: [],
            statusPagination: Status.initial,
            currentPage: 1,
            gen: gen,
          ),
        ) {
    _filterSubscription = filtersCubit.stream.listen(_onFiltersChanged);
  }
  final PokemonRepository pokemonRepository;
  final FiltersCubit filtersCubit;
  final EnumGen gen;
  late final StreamSubscription<FiltersState> _filterSubscription;

  @override
  Future<void> close() {
    _filterSubscription.cancel();
    return super.close();
  }

  Future<void> _onFiltersChanged(FiltersState filtersState) async {
    emit(state.copyWith(currentPage: 1));
    if (filtersState.paramsFilter != null && filtersState.paramsFilter != '') {}
    if (filtersState.typesSelect.isEmpty && filtersState.paramsFilter == null) {
      init();
    } else {
      final result = await pokemonRepository.filtersPokemons(
        typesfilter: filtersState.typesSelect,
        paramsFilter: filtersState.paramsFilter,
        page: state.currentPage,
      );
      emit(state.copyWith(
        listPokemons: result,
      ));
    }
  }

  Future<void> init() async {
    emit(state.copyWith(statusPagination: Status.loading));
    try {
      List<PokemonModel> list = [];
      if (gen == EnumGen.all) {
        list = await pokemonRepository.fetchPokemons(state.currentPage);
      } else {
        list = await pokemonRepository.fetchPokemonGen(gen);
        list = await dataPagination(list, state.currentPage);
      }

      emit(state.copyWith(
        listPokemons: list,
        statusPagination: Status.success,
      ));
    } catch (error) {
      emit(state.copyWith(statusPagination: Status.error));
    }
  }

  checkOtherPageExist() async {
    int startIndex = ((state.currentPage - 1) * 20);
    int endIndex = startIndex + 20;

    List<PokemonModel> list = [];
    list = await pokemonRepository.fetchPokemonGen(state.gen);

    endIndex = endIndex > list.length ? list.length : endIndex;

    return !(startIndex < endIndex);
  }

  Future<void> loadMore() async {
    if (await checkOtherPageExist()) return;

    if (state.statusPagination == Status.loading) return;
    emit(state.copyWith(statusPagination: Status.loading));
    try {
      List<PokemonModel> list = [];
      if (filtersCubit.state.typesSelect.isEmpty) {
        if (state.gen == EnumGen.all) {
          list = await pokemonRepository.fetchPokemons(state.currentPage + 1);
        } else {
          list = await pokemonRepository.fetchPokemonGen(state.gen);
          list = await dataPagination(list, state.currentPage + 1);
        }
      } else {
        list = await pokemonRepository.filtersPokemons(
          typesfilter: filtersCubit.state.typesSelect,
          paramsFilter: filtersCubit.state.paramsFilter,
          page: state.currentPage + 1,
        );
      }

      final currentList = state.listPokemons.toList();
      await Future.delayed(Duration(milliseconds: 3000));
      emit(state.copyWith(
        listPokemons: currentList + list,
        currentPage: state.currentPage + 1,
        statusPagination: Status.success,
      ));
    } catch (e) {
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

  // filterPokemonByText(String filter) async {
  //   List<PokemonModel> list = state.allPokemons.toList();
  //   if (filter != '' && state.filterTypes.isEmpty) {
  //     List<PokemonModel> listFilter = await filterByText(list, filter);
  //     emit(state.copyWith(filterPokemon: listFilter));
  //   }
  //   if (filter != '' && state.filterTypes.isNotEmpty) {
  //     List<PokemonModel> listFilter = await filterByText(list, filter);
  //     List<PokemonModel> listFilterWithTypes =
  //         await filterByType(listFilter, state.filterTypes);
  //     emit(state.copyWith(filterPokemon: listFilterWithTypes));
  //   }
  //   if (filter == '' && state.filterTypes.isEmpty) {
  //     emit(state.copyWith(filterPokemon: list));
  //   }
  //   if (filter == '' && state.filterTypes.isNotEmpty) {
  //     List<PokemonModel> listFilterWithTypes =
  //         await filterByType(list, state.filterTypes);
  //     emit(state.copyWith(filterPokemon: listFilterWithTypes));
  //   }
  // }

  // filterPokemonByType(List<String> types) async {
  //   emit(state.copyWith(filterTypes: types));
  //   List<PokemonModel> pokemons = state.allPokemons.toList();
  //   if (types.isEmpty && state.filterText == '') {
  //     emit(state.copyWith(filterPokemon: pokemons));
  //   }
  //   if (types.isEmpty && state.filterText != '') {
  //     List<PokemonModel> listFilter =
  //         await filterByText(pokemons, state.filterText);
  //     emit(state.copyWith(filterPokemon: listFilter));
  //   }
  //   if (types.isNotEmpty && state.filterText == '') {
  //     List<PokemonModel> listFilterWithTypes =
  //         await filterByType(pokemons, types);
  //     emit(state.copyWith(filterPokemon: listFilterWithTypes));
  //   }
  //   if (types.isNotEmpty && state.filterText != '') {
  //     List<PokemonModel> listFilter =
  //         await filterByText(pokemons, state.filterText);
  //     List<PokemonModel> listFilterWithTypes =
  //         await filterByType(listFilter, types);
  //     emit(state.copyWith(filterPokemon: listFilterWithTypes));
  //   }
  // }

  // filterByText(List<PokemonModel> pokemons, String filter) {
  //   List<PokemonModel> filterList = pokemons
  //       .where((i) => i.name!.toLowerCase().contains(filter.toLowerCase()))
  //       .toList();
  //   return filterList;
  // }

  // filterByType(List<PokemonModel> pokemons, List<String> types) async {
  //   List<PokemonModel> filter = [];
  //   types.forEach((type) {
  //     pokemons.forEach((pokemon) {
  //       if (pokemon.typeofpokemon!.contains(type)) {
  //         if (!filter.contains(pokemon)) {
  //           filter.add(pokemon);
  //         }
  //       }
  //     });
  //   });
  //   return filter;
  // }
}
