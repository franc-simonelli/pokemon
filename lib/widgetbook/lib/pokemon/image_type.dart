import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(
  name: 'Image type slider',
  type: ImageType,
)
Widget typeImageSlider(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.black54,
      child: ImageType(
        typeImg: context.knobs.list(
          label: 'Type',
          options: ['Fire', 'Water', 'Grass'],
          initialOption: 'Fire',
        ),
      ),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image type fire',
  type: ImageType,
)
Widget typeImageFire(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.deepOrange,
      child: const ImageType(typeImg: 'Fire'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image type water',
  type: ImageType,
)
Widget typeImageWater(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.blue,
      child: const ImageType(typeImg: 'Water'),
    ),
  );
}

@widgetbook.UseCase(
  name: 'Image type grass',
  type: ImageType,
)
Widget typeImageGrass(BuildContext context) {
  return Center(
    child: Container(
      color: Colors.green,
      child: const ImageType(typeImg: 'Grass'),
    ),
  );
}
