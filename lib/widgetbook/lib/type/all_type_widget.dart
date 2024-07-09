import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/data/type_list.dart';
import 'package:pokedex/type/all_type_widget.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';

import 'package:pokedex/type/item_type_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'All type widget',
  type: AllTypeModalWidget,
)
Widget allTypeModalWidget(BuildContext context) {
  return BlocProvider(
    create: (context) => TypeCubit(mockTypes: allTypes),
    child: AllTypeModalWidget(),
  );
}
