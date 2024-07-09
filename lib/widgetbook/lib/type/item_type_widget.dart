import 'package:flutter/material.dart';
import 'package:pokedex/core/data/type_list.dart';

import 'package:pokedex/type/item_type_widget.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Item type widget',
  type: ItemTypeWidget,
)
Widget itemTypeWidget(BuildContext context) {
  return Center(
    child: SizedBox(
      width: 120,
      child: ItemTypeWidget(
        isSelect: context.knobs.boolean(
          label: 'Is select',
          initialValue: false,
        ),
        type: context.knobs.list(
          label: 'Type',
          options: allTypes,
          initialOption: 'Fire',
        ),
      ),
    ),
  );
}
