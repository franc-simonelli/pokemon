import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';

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
}
