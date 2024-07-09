import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/home/widget/filter_section.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Filter section',
  type: FilterSection,
)
Widget filterSection(BuildContext context) {
  return Center(
    child: BlocProvider(
      create: (context) => TypeCubit(),
      child: FilterSection(),
    ),
  );
}
