// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pokedex/shared/utils/mapping_type.dart';

class ImgType extends StatelessWidget {
  const ImgType(
      {super.key,
      required this.typeImg,
      this.width = 110,
      this.boxFit = BoxFit.contain,
      this.colorGradient});

  final String typeImg;
  final double width;
  final BoxFit boxFit;
  final List<Color>? colorGradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: colorGradient ??
              [
                Colors.transparent,
                Colors.transparent,
              ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ).createShader(bounds);
      },
      blendMode: BlendMode.srcATop,
      child: Image.asset(
        mappingType(typeImg),
        width: width,
        height: width,
        color: Colors.white.withOpacity(0.5),
        fit: boxFit,
      ),
    );
  }
}
