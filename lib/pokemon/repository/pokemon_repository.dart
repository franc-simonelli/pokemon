import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/models/stats_model.dart';
import 'package:pokedex/pokemon/utils/data_pokemons.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';

class PokemonRepository {
  // final _networkClient = NetworkClient();

  Future<List<PokemonModel>> downloadPokemon() async {
    final dio = Dio(
      BaseOptions(
        baseUrl:
            'https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json',
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    final response = await dio.get('');
    final json = jsonDecode(response.data) as List<dynamic>;
    // final content = response.data as List<dynamic>;

    return json.map((e) => PokemonModel.fromJson(e)).toList();
  }

  Future<List<PokemonModel>> fetchPokemons(int page) async {
    final list = await generateAllDataPokemons();
    final listPagination = await dataPagination(list, page);
    return listPagination;
  }

  Future<List<PokemonModel>> filtersPokemons(
      List<String> filters, int page) async {
    final list = await generateAllDataPokemons();
    final pokemonsFilter = fetchFiltersPokemons(filters, list);
    final listPagination = await dataPagination(pokemonsFilter, page);
    return listPagination;
  }

  Future<List<PokemonModel>> filtersPokemonsByText(String filter) async {
    final list = await generateAllDataPokemons();
    final pokemonsFilter = fetchFiltersPokemonsByText(filter, list);
    return pokemonsFilter;
  }

  Future<PokemonModel> fetchPokemonById(String id) async {
    return await filterPokemonById(id);
  }

  Future<List<PokemonModel>> fetchPokemonGen(EnumGen gen) async {
    switch (gen) {
      case EnumGen.none:
        return [];
      case EnumGen.all:
        return await generateAllDataPokemons();
      case EnumGen.one:
        return await getPokemonByGen(gen.getKey);
      default:
        return [];
    }
  }

  Future<PokemonModel?> fetchPokemonStatsById(
      int id, PokemonModel pokemon) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: 'https://pokeapi.co/api/v2/pokemon/$id',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      // await Future.delayed(Duration(milliseconds: 1000));
      InformationUpdateModel informationUpdate;
      List<StatsModel> stats = [];
      final response = await dio.get('');
      final data = response.data;
      final statsJson = data['stats'] as List;
      final height = data['height'] as int;
      final weight = data['weight'] as int;
      stats = statsJson.map((e) => StatsModel.fromJson(e)).toList();

      final hpStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'hp',
      );
      final attackStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'attack',
      );
      final defenseStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'defense',
      );
      final atkSpcStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'special-attack',
      );
      final defSpcStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'special-defense',
      );
      final speedStat = stats.firstWhere(
        (stat) => stat.stat?.name == 'speed',
      );

      return pokemon.copyWith(
        statsUpdate: true,
        height: height.toString(),
        weight: weight.toString(),
        hp: hpStat.baseStat,
        attack: attackStat.baseStat,
        defense: defenseStat.baseStat,
        specialAttack: atkSpcStat.baseStat,
        specialDefense: defSpcStat.baseStat,
        speed: speedStat.baseStat,
        total: hpStat.baseStat! +
            attackStat.baseStat! +
            defenseStat.baseStat! +
            atkSpcStat.baseStat! +
            defSpcStat.baseStat! +
            speedStat.baseStat!,
      );
    } catch (e) {
      print(e);
    }
    return null;
  }
}
