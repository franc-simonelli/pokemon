part of 'all_data_pokemons_cubit.dart';

class AllDataPokemonsState extends Equatable {
  const AllDataPokemonsState({
    this.fetchStatus = Status.initial,
    this.firstGen,
    this.secondGen,
    this.thirdGen,
    this.fourthGen,
    this.fifthGen,
    this.sixthGen,
    this.seventhGen,
  });

  final Status fetchStatus;
  final List<PokemonModel>? firstGen;
  final List<PokemonModel>? secondGen;
  final List<PokemonModel>? thirdGen;
  final List<PokemonModel>? fourthGen;
  final List<PokemonModel>? fifthGen;
  final List<PokemonModel>? sixthGen;
  final List<PokemonModel>? seventhGen;

  List<PokemonModel> get allData => [
        ...?firstGen,
        ...?secondGen,
        ...?thirdGen,
        ...?fourthGen,
        ...?fifthGen,
        ...?sixthGen,
        ...?seventhGen,
      ];

  @override
  List<Object?> get props => [
        fetchStatus,
        firstGen,
        secondGen,
        thirdGen,
        fourthGen,
        fifthGen,
        sixthGen,
        seventhGen,
      ];

  AllDataPokemonsState copyWith({
    Status? fetchStatus,
    List<PokemonModel>? firstGen,
    List<PokemonModel>? secondGen,
    List<PokemonModel>? thirdGen,
    List<PokemonModel>? fourthGen,
    List<PokemonModel>? fifthGen,
    List<PokemonModel>? sixthGen,
    List<PokemonModel>? seventhGen,
  }) {
    return AllDataPokemonsState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      firstGen: firstGen ?? this.firstGen,
      secondGen: secondGen ?? this.secondGen,
      thirdGen: thirdGen ?? this.thirdGen,
      fourthGen: fourthGen ?? this.fourthGen,
      fifthGen: fifthGen ?? this.fifthGen,
      sixthGen: sixthGen ?? this.sixthGen,
      seventhGen: seventhGen ?? this.seventhGen,
    );
  }
}
