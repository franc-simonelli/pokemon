import 'package:flutter/cupertino.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:translator/translator.dart';

class MyTextTranslateSmall extends StatelessWidget {
  const MyTextTranslateSmall({
    required this.text,
    this.isFontBold = false,
    this.isBorderText = false,
    this.color,
    this.textAlign,
    super.key,
  });

  final String text;
  final bool isFontBold;
  final bool isBorderText;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final translator = GoogleTranslator();
    Future<String> translateText(String text) async {
      var textUpdate = text.replaceAll('-', ' ');
      var translated =
          await translator.translate(textUpdate, from: 'en', to: 'it');
      return translated.text;
    }

    return FutureBuilder<String>(
      future: translateText(text), // Testo da tradurre
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CupertinoActivityIndicator();
        } else if (snapshot.hasError) {
          return MyText.labelSmall(
            context: context,
            text: text,
            color: color,
            isBorderText: isBorderText,
            isFontBold: isFontBold,
            textAlign: textAlign,
          );
        } else {
          return MyText.labelSmall(
            context: context,
            text: snapshot.data ?? '',
            color: color,
            isBorderText: isBorderText,
            isFontBold: isFontBold,
            textAlign: textAlign,
          );
        }
      },
    );
  }
}
