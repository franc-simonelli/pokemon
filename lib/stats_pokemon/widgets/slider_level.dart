import 'package:flutter/material.dart';

class SliderLevel extends StatelessWidget {
  const SliderLevel({
    required this.level,
    required this.changeLevel,
    this.flexSlider = 7,
    super.key,
  });

  final int level;
  final Function changeLevel;
  final int flexSlider;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Angoli arrotondati
            ),
            onTap: () {
              changeLevel(level - 1);
            },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(Icons.remove_outlined),
            ),
          ),
        ),
        Expanded(
          flex: flexSlider,
          child: Slider(
            value: level.toDouble(),
            min: 1,
            max: 100,
            divisions: 100,
            label: level.toInt().toString(),
            onChanged: (double value) {
              changeLevel(value.toInt());
            },
          ),
        ),
        Expanded(
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Angoli arrotondati
            ),
            onTap: () {
              changeLevel(level + 1);
            },
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Icon(Icons.add_outlined),
            ),
          ),
        ),
      ],
    );
  }
}
