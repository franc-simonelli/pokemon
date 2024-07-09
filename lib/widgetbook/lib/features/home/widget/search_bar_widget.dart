import 'package:flutter/material.dart';
import 'package:pokedex/features/home/widget/search_bar_widget.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Search bar',
  type: SearchBarWidget,
)
Widget searchBar(BuildContext context) {
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Center(child: SearchBarWidget()),
  );
}
