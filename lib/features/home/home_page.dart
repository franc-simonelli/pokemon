import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/filters/repository/type_repository.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/pages/pokemons_page.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  late PokemonCubit _pokemonCubit;
  late FiltersCubit _filtersCubit;

  @override
  void initState() {
    _scrollController.addListener(() async {
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent - 0) {
        await _loadMoreData();
      }
    });

    final filtersRepository = context.read<FiltersRepository>();
    final pokemonRepository = context.read<PokemonRepository>();
    _filtersCubit = FiltersCubit(
      filtersRepository: filtersRepository,
    )..fetchFilters();
    _pokemonCubit = PokemonCubit(
      pokemonRepository: pokemonRepository,
      filtersCubit: _filtersCubit,
      gen: EnumGen.all,
    )..init();

    print('INIT HOME: ');
    super.initState();
  }

  @override
  void dispose() {
    print('DISPOSE HOME:');
    _pokemonCubit.close();
    _filtersCubit.close();
    super.dispose();
  }

  Future<void> _loadMoreData() async {
    _pokemonCubit.loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _pokemonCubit),
        BlocProvider.value(value: _filtersCubit)
      ],
      child: PokemonsPage(
        gen: EnumGen.all,
        scrollController: _scrollController,
      ),
    );
  }
}
