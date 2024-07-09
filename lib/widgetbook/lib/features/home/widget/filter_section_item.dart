import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/features/home/widget/filter_section_item.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Filter section item',
  type: FilterSectionItem,
)
Widget filterSectionItem(BuildContext context) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context).size.width / 2,
      child: const FilterSectionItem(
        text: 'Tipo',
      ),
    ),
  );
}
