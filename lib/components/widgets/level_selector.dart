import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class LevelSelector extends StatefulWidget {
  const LevelSelector({
    super.key,
    required this.initialLevel,
    required this.isEditing,
    required this.onLevelChanged,
  });

  final int initialLevel;
  final bool isEditing;
  final Function(int) onLevelChanged;

  @override
  State<LevelSelector> createState() => _LevelSelectorState();
}

class _LevelSelectorState extends State<LevelSelector> {
  int _selectedLevel = 1;
  bool _isTouching = false;

  @override
  void initState() {
    super.initState();
    _selectedLevel = widget.initialLevel;
  }

  void _onPointerDown(PointerDownEvent event) {
    setState(() => _isTouching = true);
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() => _isTouching = false);
  }

  @override
  Widget build(BuildContext context) {
    return widget.isEditing
        ? Listener(
            onPointerDown: _onPointerDown,
            onPointerUp: _onPointerUp,
            child: AnimatedScale(
              scale: _isTouching ? 1.5 : 1.0,
              duration: const Duration(milliseconds: 150),
              child: SizedBox(
                height: 80,
                width: 75,
                child: CupertinoPicker(
                  itemExtent: 32,
                  scrollController: FixedExtentScrollController(
                      initialItem: _selectedLevel - 1),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      _selectedLevel = index + 1;
                    });
                    widget.onLevelChanged(_selectedLevel);
                  },
                  children: List.generate(100, (index) {
                    return Center(
                      child: MyText.labelMedium(
                        context: context,
                        text: '${index + 1}',
                      ),
                    );
                  }),
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(7),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade900,
                borderRadius: BorderRadius.circular(12),
              ),
              child: MyText.labelMedium(
                context: context,
                text: 'Base',
                textAlign: TextAlign.center,
              ),
            ),
          );
    //   ],
    // );
    // return widget.isEditing
    //     ? Container(
    //         decoration: BoxDecoration(border: Border.all(color: Colors.white)),
    //         height: 80,
    //         width: 80,
    //         child: CupertinoPicker(
    //           itemExtent: 32,
    //           scrollController:
    //               FixedExtentScrollController(initialItem: _selectedLevel - 1),
    //           onSelectedItemChanged: (index) {
    //             setState(() {
    //               _selectedLevel = index + 1;
    //             });
    //             widget.onLevelChanged(_selectedLevel);
    //           },
    //           children: List.generate(100, (index) {
    //             return Center(child: Text('${index + 1}'));
    //           }),
    //         ),
    //       )
    //     : Container(
    //         decoration: BoxDecoration(border: Border.all(color: Colors.red)),
    //         padding: EdgeInsets.all(4),
    //         child: Container(
    //           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
    //           decoration: BoxDecoration(
    //             color: Colors.grey,
    //             borderRadius: BorderRadius.circular(12),
    //           ),
    //           child: Text(
    //             'Base',
    //             style: const TextStyle(color: Colors.white),
    //           ),
    //         ),
    //       );
  }
}
