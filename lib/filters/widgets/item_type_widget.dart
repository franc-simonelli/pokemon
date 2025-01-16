import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/image_type.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class ItemTypeWidget extends StatelessWidget {
  const ItemTypeWidget({
    required this.type,
    required this.isSelect,
    super.key,
  });

  final String type;
  final bool isSelect;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 100),
      opacity: isSelect ? 0.3 : 1.0,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 3),
                color: mappingColors(type),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 60,
              child: ImageType(typeImg: type),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                children: [
                  Container(
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey.shade900, width: 1),
                        color: mappingColors(type),
                      ),
                      child: Center(
                        child: MyText.labelMedium(
                          context: context,
                          text: type,
                          isBorderText: true,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 5,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
