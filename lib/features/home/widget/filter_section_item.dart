import 'package:flutter/material.dart';
import 'package:pokedex/pokemon/widget/info_type_section.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class FilterSectionItem extends StatelessWidget {
  const FilterSectionItem({
    required this.text,
    this.typesSelect,
    this.onPress,
    super.key,
  });

  final String text;
  final List<String>? typesSelect;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade700,
              offset: Offset(0, -1),
              blurRadius: 1,
            ),
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 3),
              blurRadius: 5,
            ),
          ],
        ),
        child: typesSelect != null && typesSelect!.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: typesSelect?.length,
                        itemBuilder: (context, index) {
                          final item = typesSelect?[index];
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: SizedBox(
                              width: 20,
                              child: TypeInfoSection(type: item!),
                            ),
                          );
                        },
                      ),
                    ),
                    const Icon(
                      Icons.arrow_drop_down_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.labelMedium(
                    context: context,
                    text: text,
                    isFontBold: true,
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.arrow_drop_down_rounded,
                    color: Colors.white,
                  )
                ],
              ),
      ),
    );
  }
}
