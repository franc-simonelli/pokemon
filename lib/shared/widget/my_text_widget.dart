import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText({
    required this.text,
    required this.style,
    this.isFontBold = false,
    this.textAlign,
    super.key,
  });

  final String text;
  final TextStyle style;
  final bool isFontBold;
  final TextAlign? textAlign;

  factory MyText.labelSmall({
    required BuildContext context,
    required String text,
    bool isFontBold = false,
    bool isBorderText = false,
    Color? color,
    TextAlign? textAlign,
  }) {
    final appTextTheme = Theme.of(context).textTheme;
    final appColors = Theme.of(context).colorScheme;
    return MyText(
      text: text,
      textAlign: textAlign,
      style: appTextTheme.labelSmall!.copyWith(
        color: color ?? appColors.onSurface,
        fontWeight: isFontBold ? FontWeight.bold : FontWeight.normal,
        shadows: isBorderText
            ? [
                BoxShadow(
                    // bottomLeft
                    offset: const Offset(-1.0, -1.0),
                    blurRadius: 3,
                    spreadRadius: 3,
                    color: Colors.black),
                BoxShadow(
                    // bottomRight
                    offset: const Offset(1.5, -1.5),
                    blurRadius: 3,
                    spreadRadius: 5,
                    color: Colors.black),
                BoxShadow(
                    // topRight
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 3,
                    spreadRadius: 5,
                    color: Colors.black),
                BoxShadow(
                    // topLeft
                    offset: const Offset(-1.5, 1.5),
                    blurRadius: 0,
                    spreadRadius: 5,
                    color: Colors.black)
              ]
            : [],
      ),
    );
  }

  factory MyText.labelMedium({
    required BuildContext context,
    required String text,
    bool isFontBold = false,
    bool isBorderText = false,
    bool isUnderLine = false,
    Color? color,
    TextAlign? textAlign,
  }) {
    final appTextTheme = Theme.of(context).textTheme;
    final appColors = Theme.of(context).colorScheme;
    return MyText(
      text: text,
      textAlign: textAlign,
      style: appTextTheme.labelMedium!.copyWith(
        color: color ?? appColors.onSurface,
        decoration: isUnderLine ? TextDecoration.underline : null,
        fontWeight: isFontBold ? FontWeight.bold : FontWeight.normal,
        shadows: isBorderText
            ? [
                const BoxShadow(
                  // bottomLeft
                  offset: Offset(-1.0, -1.0),
                  blurRadius: 3,
                  spreadRadius: 3,
                  color: Colors.black,
                ),
                const BoxShadow(
                  // bottomRight
                  offset: Offset(1.5, -1.5),
                  blurRadius: 3,
                  spreadRadius: 5,
                  color: Colors.black,
                ),
                const BoxShadow(
                  // topRight
                  offset: Offset(1.5, 1.5),
                  blurRadius: 3,
                  spreadRadius: 5,
                  color: Colors.black,
                ),
                const BoxShadow(
                  // topLeft
                  offset: Offset(-1.5, 1.5),
                  blurRadius: 0,
                  spreadRadius: 5,
                  color: Colors.black,
                )
              ]
            : [],
      ),
    );
  }

  factory MyText.labelLarge({
    required BuildContext context,
    required String text,
    bool isFontBold = false,
    bool isBorderText = false,
    bool isUnderLine = false,
    Color? color,
    Color? colorBorder,
  }) {
    final appTextTheme = Theme.of(context).textTheme;
    final appColors = Theme.of(context).colorScheme;
    return MyText(
      text: text,
      style: appTextTheme.labelLarge!.copyWith(
        fontSize: 22,
        color: color ?? appColors.onSurface,
        decoration: isUnderLine ? TextDecoration.underline : null,
        fontWeight: isFontBold ? FontWeight.bold : FontWeight.normal,
        shadows: isBorderText
            ? [
                BoxShadow(
                  // bottomLeft
                  offset: const Offset(-1.0, -1.0),
                  blurRadius: 3,
                  spreadRadius: 3,
                  color: colorBorder ?? Colors.black,
                ),
                BoxShadow(
                  // bottomRight
                  offset: const Offset(1.5, -1.5),
                  blurRadius: 3,
                  spreadRadius: 5,
                  color: colorBorder ?? Colors.black,
                ),
                BoxShadow(
                  // topRight
                  offset: const Offset(1.5, 1.5),
                  blurRadius: 3,
                  spreadRadius: 5,
                  color: colorBorder ?? Colors.black,
                ),
                BoxShadow(
                  // topLeft
                  offset: const Offset(-1.5, 1.5),
                  blurRadius: 0,
                  spreadRadius: 5,
                  color: colorBorder ?? Colors.black,
                )
              ]
            : [],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
    );
  }
}
