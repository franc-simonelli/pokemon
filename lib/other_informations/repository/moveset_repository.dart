// ignore_for_file: empty_catches

import 'package:dio/dio.dart';
import 'package:pokedex/other_informations/models/ability_model.dart';
import 'package:pokedex/other_informations/models/move_model.dart';
import 'package:pokedex/other_informations/models/moveset_model.dart';
import 'package:pokedex/other_informations/utils/generate_id_by_url.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

class MovesetRepository {
  Future<PokemonModel?> fetchPokemonMovesets(
    int id,
    PokemonModel pokemon,
  ) async {
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

      MovesetModel moveset;
      List<AbilityModel> abilities = [];
      List<MoveModel> moves = [];

      final response = await dio.get('');
      final data = response.data;
      final abilitiesjSON = data['abilities'] as List;
      final movesJson = data['moves'] as List;

      for (int i = 0; i < movesJson.length; i++) {
        if (movesJson[i] is Map<String, dynamic>) {
          final id = generateIdByUrl(movesJson[i]['move']['url']);
          (movesJson[i] as Map<String, dynamic>)['id'] = id;
        }
      }

      abilities = abilitiesjSON.map((e) => AbilityModel.fromJson(e)).toList();
      moves = movesJson.map((e) => MoveModel.fromJson(e)).toList();

      moveset = MovesetModel(
        abilities: abilities,
        moves: moves,
      );
      return pokemon.copyWith(
        movesetUpdate: true,
        moveset: moveset,
      );
    } catch (e) {}
    return null;
  }

  Future<AbilityModel?> fetchPokemonAbilityByUrl(
    AbilityModel ability,
  ) async {
    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: ability.ability?.url ?? '',
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );
      // await Future.delayed(Duration(milliseconds: 1000));

      final response = await dio.get('');
      final data = response.data;
      final id = data['id'] as int;
      final effectEntriesJson = data['effect_entries'] as List;
      final enEffect = effectEntriesJson.firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => null,
      );
      return ability.copyWith(
        id: id,
        isDownloaded: true,
        effectEntries: EffectModel(
          effect: enEffect['effect'],
          shortEffect: enEffect['short_effect'],
        ),
      );
    } catch (e) {}
    return null;
  }

  Future<MoveModel?> fetchPokemonMoveByUrl(
    // MoveModel move,
    String url,
  ) async {
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
      // await Future.delayed(Duration(milliseconds: 1000));

      final response = await dio.get('');
      final data = response.data;
      final id = data['id'] as int;
      final names = data['names'] as List;
      final name = names.firstWhere(
        (entry) => entry['language']['name'] == 'it',
        orElse: () => null,
      );
      final accuracy = data['accuracy'] as int?;
      final power = data['power'] as int?;
      final pp = data['pp'] as int;
      final priority = data['priority'] as int;
      final damageClass = data['damage_class']['name'];
      final type = data['type']['name'];
      final effectEntriesJson = data['effect_entries'] as List;
      final enEffect = effectEntriesJson.firstWhere(
        (entry) => entry['language']['name'] == 'en',
        orElse: () => null,
      );

      String effect = '';
      String shortEffect = '';
      if (enEffect != null) {
        effect = enEffect['effect'] ?? '';
        shortEffect = enEffect['short_effect'] ?? '';
      }

      return MoveModel(
        id: id,
        move: MoveNameModel(
          name: name['name'],
        ),
        isDownloaded: true,
        accuracy: accuracy,
        power: power,
        pp: pp,
        priority: priority,
        damageClass: damageClass,
        type: type,
        effectEntries: EffectModel(
          effect: effect,
          shortEffect: shortEffect,
        ),
      );
    } catch (e) {}
    return null;
  }
}
