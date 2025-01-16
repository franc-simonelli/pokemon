import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/evolution_line/evolution_line.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/info_section.dart';
import 'package:pokedex/pokemon/widget/stats_pokemon.dart';
import 'package:pokedex/pokemon_detail/cubit/pokemon_detail_cubit.dart';
import 'package:pokedex/pokemon_detail/widgets/card_info_detail.dart';
import 'package:pokedex/pokemon_detail/widgets/header_section.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class PokemonDetailPage extends StatefulWidget {
  const PokemonDetailPage({
    required this.pokemonSelected,
    required this.gen,
    super.key,
  });

  final PokemonModel pokemonSelected;
  final EnumGen gen;

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonDetailCubit _pokemonDetailCubit;

  @override
  void initState() {
    final pokemonRepository = context.read<PokemonRepository>();
    _pokemonDetailCubit = PokemonDetailCubit(
      pokemonSelected: widget.pokemonSelected,
      gen: widget.gen,
      pokemonRepository: pokemonRepository,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _pokemonDetailCubit,
      child: BlocBuilder<PokemonDetailCubit, PokemonDetailState>(
        builder: (context, state) {
          if (state.pokemonStatus == Status.loading) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state.pokemonStatus == Status.success) {
            return Scaffold(
              backgroundColor: Colors.grey.shade900,
              appBar: _buildAppBar(context, state.pokemonSelected),
              body: Stack(
                children: [
                  // Positioned(
                  //   top: -30,
                  //   right: -80,
                  //   child: SizedBox(
                  //     width: 400,
                  //     child: Opacity(
                  //       opacity: 0.1,
                  //       child: Image.asset(
                  //         mappingType(
                  //           widget.pokemon.typeofpokemon?[0],
                  //         ),
                  //         fit: BoxFit.cover,
                  //         // fit: BoxFit.contain,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: HeaderSection(),
                          ),
                          SizedBox(height: 20),
                          _buildDescription(context, state.pokemonSelected),
                          SizedBox(height: 30),
                          _buildStats(state.pokemonSelected),
                          SizedBox(height: 50),
                          _buildInfo(state.pokemonSelected),
                          SizedBox(height: 50),
                          // MyText.labelLarge(
                          //     context: context, text: 'Debolezze'),
                          // SizedBox(height: 10),
                          // _buildDebolezze(state.pokemonSelected),
                          // SizedBox(height: 50),
                          EvolutionLinePage(
                            pokemon: state.pokemonSelected,
                            key: UniqueKey(),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildDebolezze(PokemonModel pokemon) {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: pokemon.weaknesses?.length,
        itemBuilder: (context, index) {
          final item = pokemon.weaknesses?[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InfoSection(
              pokemon: pokemon,
              element: item ?? '',
            ),
          );
        },
      ),
    );
  }

  Widget _buildDescription(BuildContext context, PokemonModel pokemon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            offset: const Offset(-2, -2),
          ),
          const BoxShadow(
            color: Colors.black,
            offset: Offset(3, 3),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MyText.labelMedium(
          context: context,
          text: pokemon.xdescription ?? '',
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, PokemonModel pokemon) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: MyText.labelLarge(
        context: context,
        text: pokemon.name ?? '',
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.favorite_border_outlined),
        ),
      ],
    );
  }

  Widget _buildInfo(PokemonModel pokemon) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: CardInfoDetail(
                isLoading: pokemon.statsUpdate == null,
                info: 'Weight',
                value: pokemon.statsUpdate != null && pokemon.statsUpdate!
                    ? pokemon.weightMap
                    : '0',
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CardInfoDetail(
                isLoading: pokemon.statsUpdate == null,
                info: 'Height',
                value: pokemon.statsUpdate != null && pokemon.statsUpdate!
                    ? pokemon.heightMap
                    : '0',
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: CardInfoDetail(
                info: 'Category',
                value: pokemon.category ?? '',
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: CardInfoDetail(
                info: 'Ability',
                value: pokemon.abilities!.first,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStats(PokemonModel pokemon) {
    return Column(
      children: [
        StatsPokemon(
          stats: 'Hp',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.hp.toString()
              : '0',
          color: Colors.green,
        ),
        StatsPokemon(
          stats: 'Attack',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.attack.toString()
              : '0',
          color: Colors.orange,
        ),
        StatsPokemon(
          stats: 'Defense',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.defense.toString()
              : '0',
          color: Colors.red,
        ),
        StatsPokemon(
          stats: 'Sp. Atk',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.specialAttack.toString()
              : '0',
          color: Colors.blue,
        ),
        StatsPokemon(
          stats: 'Sp. Def',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.specialDefense.toString()
              : '0',
          color: Colors.blueGrey,
        ),
        StatsPokemon(
          stats: 'Speed',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.speed.toString()
              : '0',
          color: Colors.purple,
        ),
        StatsPokemon(
          stats: 'Total',
          value: pokemon.statsUpdate != null && pokemon.statsUpdate!
              ? pokemon.total.toString()
              : '0',
          widthMax: 700,
          color: Colors.grey,
        )
      ],
    );
  }
}
