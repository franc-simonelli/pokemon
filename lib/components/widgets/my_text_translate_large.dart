import 'package:flutter/cupertino.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:translator/translator.dart';

class MyTextTranslateLarge extends StatelessWidget {
  const MyTextTranslateLarge({
    required this.text,
    this.isFontBold = false,
    this.isBorderText = false,
    this.isUnderLine = false,
    this.color,
    this.colorBorder,
    super.key,
  });

  final String text;
  final bool isFontBold;
  final bool isBorderText;
  final bool isUnderLine;
  final Color? color;
  final Color? colorBorder;

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    Future<String> translateText(String text) async {
      var translated = await translator.translate(text, from: 'en', to: 'it');
      return translated.text;
    }

    return FutureBuilder<String>(
      future: translateText(text), // Testo da tradurre
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        } else if (snapshot.hasError) {
          return MyText.labelLarge(
            context: context,
            text: text,
            color: color,
            colorBorder: colorBorder,
            isBorderText: isBorderText,
            isFontBold: isFontBold,
            isUnderLine: isUnderLine,
          );
        } else {
          return MyText.labelLarge(
            context: context,
            text: snapshot.data ?? '',
            color: color,
            colorBorder: colorBorder,
            isBorderText: isBorderText,
            isFontBold: isFontBold,
            isUnderLine: isUnderLine,
          );
        }
      },
    );
  }
}
