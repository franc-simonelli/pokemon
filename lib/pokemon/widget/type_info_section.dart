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
      width: 25,
      height: 25,
      decoration: const BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Image.asset(
            mappingType(type),
            // color: mappingColors(type),
            color: type.toLowerCase() == 'dark'
                ? Colors.white54
                : mappingColors(type),
          ),
        ),
      ),
    );
  }
}
