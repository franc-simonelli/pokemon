import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/data/pokemon_list.dart';
import 'package:pokedex/features/home/home_screen.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Home screen',
  type: HomeScreen,
)
Widget homeScreen(BuildContext context) {
  return MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => PokemonCubit(listMock: dataList)),
      BlocProvider(create: (context) => TypeCubit()),
    ],
    child: const HomeScreen(),
  );
}
