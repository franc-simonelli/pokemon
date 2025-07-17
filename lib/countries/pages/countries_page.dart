import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/widgets/base_app_bar.dart';
import 'package:pokedex/countries/cubit/countries_cubit.dart';
import 'package:pokedex/countries/widgets/countries_content.dart';
import 'package:pokedex/countries/widgets/country_card.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CountriesPage extends StatelessWidget {
  const CountriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

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

    // return SafeArea(
    //   bottom: false,
    //   top: true,
    //   child: CustomScrollView(
    //     controller: scrollController,
    //     physics: const ScrollPhysics(
    //       parent: BouncingScrollPhysics(),
    //     ),
    //     slivers: [
    //       BaseAppBar(title: 'Countries'),
    //       BlocBuilder<CountriesCubit, CountriesState>(
    //         builder: (context, state) {
    //           return SliverPadding(
    //             padding: const EdgeInsets.only(
    //               bottom: 100,
    //             ),
    //             sliver: SliverList.builder(
    //               itemCount: state.countries.length,
    //               itemBuilder: (context, index) {
    //                 final item = state.countries[index];
    //                 return Padding(
    //                   padding: const EdgeInsets.symmetric(
    //                     horizontal: 20,
    //                     vertical: 10,
    //                   ),
    //                   child: CardCountry(
    //                     item: item,
    //                   ),
    //                 );
    //               },
    //             ),
    //           );
    //         },
    //       ),
    //     ],
    //   ),
    // );
  }
}
