import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/info_type_section.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    super.key,
    required this.element,
    this.isBorder = true,
  });

  final String element;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.identity()
        ..setEntry(3, 1, 0.004)
        ..rotateX(0.0)
        ..rotateY(0.0),
      child: Container(
        decoration: isBorder
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black54,
                border: Border.all(color: Colors.white),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 5,
            right: 10,
            top: 5,
            bottom: 5,
          ),
          child: Row(
            children: [
              TypeInfoSection(type: element),
              const SizedBox(width: 8),
              Text(
                element,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
