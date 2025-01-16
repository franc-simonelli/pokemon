import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/filters/repository/type_repository.dart';
part 'filters_state.dart';
part 'filters_cubit.freezed.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit({
    required this.filtersRepository,
  }) : super(
          const FiltersState(
            allTypes: [],
            typesSelect: [],
          ),
        );
  final FiltersRepository filtersRepository;

  fetchFilters() async {
    final types = await filtersRepository.fetchFilters();
    emit(state.copyWith(allTypes: types));
  }

  selectFilters(String type) {
    List<String> types = state.typesSelect.toList();

    if (types.contains(type)) {
      types.remove(type);
    } else {
      types.add(type);
    }
    emit(state.copyWith(typesSelect: types));
  }

  removeAllTypes() async {
    emit(state.copyWith(typesSelect: []));
  }

  setFilterText(String text) {
    emit(state.copyWith(textFilter: text));
  }
}
