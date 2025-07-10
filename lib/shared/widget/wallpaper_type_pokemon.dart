import 'package:flutter/material.dart';
import 'package:pokedex/components/widgets/img_type.dart';
import 'package:pokedex/shared/utils/mapping_color.dart';

class WallpaperTypePokemon extends StatelessWidget {
  const WallpaperTypePokemon({
    required this.type,
    super.key,
  });

  final String type;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      right: -110,
      child: Opacity(
        opacity: 1,
        child: ImgType(
          width: 450,
          typeImg: type,
          boxFit: BoxFit.contain,
          colorGradient: [
            Colors.black87,
            Colors.black54,
            mappingColors(
              type,
            ),
            Colors.black54,
            mappingColors(
              type,
            ),
          ],
        ),
      ),
    );
  }
}
