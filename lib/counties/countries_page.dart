import 'package:flutter/material.dart';
import 'package:pokedex/counties/widgets/countries_content.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText.labelLarge(
          context: context,
          text: 'Countries',
          isFontBold: true,
        ),
        centerTitle: false,
      ),
      body: CountriesContent(),
    );
  }
}
