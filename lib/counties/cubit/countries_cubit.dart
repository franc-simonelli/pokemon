import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex/counties/repositories/countries_repository.dart';
import 'package:pokedex/counties/models/country_model.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

part 'countries_state.dart';
part 'countries_cubit.freezed.dart';

class CountriesCubit extends Cubit<CountriesState> {
  CountriesCubit({
    required this.countriesRepository,
  }) : super(CountriesState(
          countriesState: Status.initial,
          countries: [],
        ));

  final CountriesRepository countriesRepository;

  fetchCountries() async {
    emit(state.copyWith(countriesState: Status.loading));
    final countries = countriesRepository.fecthCountries();
    emit(state.copyWith(countries: countries, countriesState: Status.success));
  }
}
