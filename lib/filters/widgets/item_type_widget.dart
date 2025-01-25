import 'package:flutter/material.dart';
import 'package:pokedex/components/widgets/img_type.dart';
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
      duration: const Duration(milliseconds: 200),
      opacity: isSelect ? 0.3 : 1.0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transformAlignment: Alignment.center,
        transform: isSelect
            ? Matrix4.identity().scaled(0.90, 0.90, 0.40)
            : Matrix4.identity(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImgType(
              colorGradient: [
                mappingColors(
                  type,
                ),
                mappingColors(
                  type,
                ),
                mappingColors(
                  type,
                ),
                Colors.black12,
                Colors.transparent,
              ],
              typeImg: type,
            ),
            SizedBox(height: 10),
            MyText.labelSmall(context: context, text: type)
          ],
        ),
      ),
    );
  }
}
