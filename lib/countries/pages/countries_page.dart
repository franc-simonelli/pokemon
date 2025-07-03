import 'package:flutter/material.dart';
import 'package:pokedex/countries/widgets/countries_content.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/shared/widget/pkm_scaffold.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarHeight = AppBar().preferredSize.height;
    final safeAreaHeight = MediaQuery.of(context).padding.top;
    return PkmScaffold(
      appBar: _buildAppBar(context),
      body: CountriesContent(
        heightAppBar: appBarHeight + safeAreaHeight,
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: MyText.labelLarge(
        context: context,
        text: 'Countries',
        isFontBold: true,
      ),
      centerTitle: true,
    );
  }
}
