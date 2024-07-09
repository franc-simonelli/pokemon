import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';

class TypeInfoSection extends StatelessWidget {
  const TypeInfoSection({
    super.key,
    required this.type,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Image.asset(
            mappingType(type),
            color: mappingColors(type),
          ),
        ),
      ),
    );
  }
}
