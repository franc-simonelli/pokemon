part of 'countries_cubit.dart';

@freezed
class CountriesState with _$CountriesState {
  const factory CountriesState({
    required Status countriesState,
    required List<CountryModel> countries,
  }) = _CountriesState;
}
