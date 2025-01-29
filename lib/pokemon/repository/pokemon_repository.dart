// ignore_for_file: empty_catches

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/models/stats_model.dart';
import 'package:pokedex/pokemon/models/type_model.dart';
import 'package:pokedex/pokemon/utils/check_type.dart';
import 'package:pokedex/pokemon/utils/data_pokemons.dart';
import 'package:pokedex/pokemon/utils/generate_weakness_reistence.dart';
import 'package:pokedex/pokemon/utils/save_types.dart';
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

  Future<List<PokemonModel>> filtersPokemons({
    required int page,
    required EnumGen gen,
    List<String>? typesfilter,
    String? paramsFilter,
  }) async {
    final list = await fetchPokemonGen(gen);
    final pokemonsFilter = fetchFiltersPokemons(
      pokemons: list,
      typesFilter: typesfilter ?? [],
      paramsFilter: paramsFilter,
    );
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
      // case EnumGen.one:
      //   return await getPokemonByGen(gen.getKey);
      default:
        return await getPokemonByGen(gen.getKey);
    }
  }

  Future<PokemonModel?> fetchPokemonInfoById(
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

      List<StatsModel> stats = [];
      List<dynamic> types = [];
      List<String> weaknesses = [];
      List<String> resistence = [];
      List<String> immunity = [];

      final response = await dio.get('');
      final data = response.data;
      final statsJson = data['stats'] as List;
      final height = data['height'] as int;
      final weight = data['weight'] as int;
      final typesJson = data['types'] as List;
      stats = statsJson.map((e) => StatsModel.fromJson(e)).toList();
      for (var item in typesJson) {
        types.add(item['type']);
      }

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

      for (var item in types) {
        final type = await checkType(item['name']);
        if (type != null) {
          weaknesses.addAll(type.weaknesses);
          resistence.addAll(type.resistence);
          immunity.addAll(type.immunity);
        } else {
          final result = await fetchTypeDetailById(item['url']);

          TypeModel newType = TypeModel(
            name: item['name'],
            weaknesses: result?['weaknesses'],
            resistence: result?['resistence'],
            immunity: result?['immunity'],
          );
          await saveType(newType);
          weaknesses.addAll(result?['weaknesses']);
          resistence.addAll(result?['resistence']);
          immunity.addAll(result?['immunity']);
        }
      }

      final generateWeakResImm = generateWeaknessResistence(
        doubleDamageFrom: weaknesses,
        halfDamageFrom: resistence,
        immunity: immunity,
      );

      return pokemon.copyWith(
        infoUpdate: true,
        weaknesses: generateWeakResImm['weaknesses'],
        resistence: generateWeakResImm['resistence'],
        immunity: generateWeakResImm['immunity'],
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
    } catch (e) {}
    return null;
  }

  Future<Map<String, dynamic>?> fetchTypeDetailById(String url) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: url,
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      final response = await dio.get('');
      List<String> weaknesses = [];
      List<String> resistence = [];
      List<String> immunity = [];

      final data = response.data;
      final relations = data['damage_relations'] as Map<String, dynamic>;
      final weakJson = relations['double_damage_from'] as List;
      final resJson = relations['half_damage_from'] as List;
      final immunityJson = relations['no_damage_from'] as List;
      for (var item in weakJson) {
        weaknesses.add(item['name']);
      }
      for (var item in resJson) {
        resistence.add(item['name']);
      }
      for (var item in immunityJson) {
        immunity.add(item['name']);
      }
      List<String> uniqueListImmunity = immunity.toSet().toList();

      return {
        'weaknesses': weaknesses,
        'resistence': resistence,
        'immunity': uniqueListImmunity,
      };
    } catch (e) {}
    return null;
  }
}
