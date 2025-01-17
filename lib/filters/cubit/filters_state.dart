part of 'filters_cubit.dart';

@freezed
class FiltersState with _$FiltersState {
  const factory FiltersState({
    required List<String> allTypes,
    required List<String> typesSelect,
    String? textFilter,
    String? paramsFilter,
  }) = _FiltersState;
}
