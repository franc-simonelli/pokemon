import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/counties/countries_page.dart';
import 'package:pokedex/features/home/home_page.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';
import 'package:pokedex/filters/repository/type_repository.dart';
import 'package:pokedex/filters/repository/type_repository.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/pages/pokemons_page.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CountryPokemonListPage extends StatefulWidget {
  const CountryPokemonListPage({
    required this.gen,
    super.key,
  });

  final EnumGen gen;

  @override
  State<CountryPokemonListPage> createState() => _CountryPokemonListPageState();
}

class _CountryPokemonListPageState extends State<CountryPokemonListPage> {
  late PokemonCubit _pokemonCubit;
  late FiltersCubit _filtersCubit;
  final ScrollController _scrollController = ScrollController();

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
    );
    _pokemonCubit = PokemonCubit(
      pokemonRepository: pokemonRepository,
      filtersCubit: _filtersCubit,
      gen: widget.gen,
    )..init();
    print('INIT COUNTRY POKEMON');
    super.initState();
  }

  @override
  void dispose() {
    _pokemonCubit.close();
    _filtersCubit.close();
    print('DISPOSE COUNTRY POKEMON');
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
        BlocProvider.value(value: _filtersCubit),
      ],
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: PokemonsPage(
          gen: widget.gen,
          scrollController: _scrollController,
        ),
      ),
    );
  }
}
