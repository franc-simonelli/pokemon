import 'package:flutter/material.dart';
import 'package:pokedex/countries/widgets/countries_content.dart';

import 'package:pokedex/shared/widget/my_text_widget.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final appBarHeight = AppBar().preferredSize.height;
    // final safeAreaHeight = MediaQuery.of(context).padding.top;

    return Column(
      children: [
        _buildAppBar(context),
        CountriesContent(),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      title: MyText.labelLarge(
        context: context,
        text: 'Countries',
        isFontBold: true,
      ),
      centerTitle: true,
    );
  }
}
