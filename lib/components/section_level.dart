// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pokedex/components/widgets/level_selector.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class SectionLevel extends StatelessWidget {
  const SectionLevel({
    required this.initialLevel,
    required this.showLvSection,
    required this.changeLevel,
    required this.onShowLvSelection,
    super.key,
  });

  final int initialLevel;
  final bool showLvSection;
  final Function(int) changeLevel;
  final VoidCallback onShowLvSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: MyText.labelMedium(
                context: context,
                text: 'LV',
                isFontBold: true,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: LevelSelector(
              initialLevel: initialLevel,
              isEditing: showLvSection,
              onLevelChanged: changeLevel,
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: onShowLvSelection,
              child: Icon(Icons.edit),
            ),
          )
        ],
      ),
    );
  }
}
