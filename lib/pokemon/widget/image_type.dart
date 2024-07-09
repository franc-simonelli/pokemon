import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';

class ImageType extends StatelessWidget {
  const ImageType({
    super.key,
    required this.typeImg,
  });

  final String typeImg;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      mappingType(typeImg),
      width: 120,
      height: 120,
      color: Colors.white.withOpacity(0.5),
    );
  }
}
