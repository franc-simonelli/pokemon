import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/type_info_section.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class TypePokemon extends StatelessWidget {
  const TypePokemon({
    super.key,
    required this.element,
    this.isBorder = true,
    this.isSmallText = false,
  });

  final String element;
  final bool isBorder;
  final bool isSmallText;

  @override
  Widget build(BuildContext context) {
    return
        // Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 1, 0.004)
        //     ..rotateX(0)
        //     ..rotateY(0.4),
        //   child:
        Container(
      // decoration: isBorder
      //     ? BoxDecoration(
      //         borderRadius: BorderRadius.circular(30),
      //         color: Colors.black54,
      //         border: Border.all(
      //           width: 1,
      //           color: element.toLowerCase() == 'dark'
      //               ? Colors.white54
      //               : mappingColors(element),
      //         ),
      //       )
      //     : null,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 0,
          right: 10,
          top: 5,
          bottom: 0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TypeInfoSection(type: element),
            const SizedBox(width: 8),
            isSmallText
                ? MyText.labelSmall(
                    context: context,
                    text: element,
                    color: Colors.white,
                    isFontBold: true,
                  )
                : MyText.labelMedium(
                    context: context,
                    text: element,
                    color: Colors.white,
                    isFontBold: true,
                    isBorderText: true,
                  ),
          ],
        ),
      ),
      // ),
    );
  }
}
