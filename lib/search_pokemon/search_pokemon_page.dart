import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/search_pokemon/cubit/search_pokemon_cubit.dart';
import 'package:pokedex/search_pokemon/widgets/search_pokemon_content.dart';

class SearchPokemonPage extends StatefulWidget {
  const SearchPokemonPage({super.key});

  @override
  State<SearchPokemonPage> createState() => _SearchPokemonPageState();
}

class _SearchPokemonPageState extends State<SearchPokemonPage> {
  late SearchPokemonCubit _searchPokemonCubit;

  @override
  void initState() {
    final pokemonRepository = context.read<PokemonRepository>();
    _searchPokemonCubit = SearchPokemonCubit(
      pokemonRepository: pokemonRepository,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchPokemonCubit>.value(
      value: _searchPokemonCubit,
      child: SearchPokemonContent(),
    );
  }
}
