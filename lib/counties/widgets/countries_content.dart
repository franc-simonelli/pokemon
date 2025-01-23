import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/counties/cubit/countries_cubit.dart';
import 'package:pokedex/counties/widgets/country_card.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';

class CountriesContent extends StatelessWidget {
  const CountriesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountriesCubit, CountriesState>(
      builder: (context, state) {
        if (state.countriesState == Status.loading) {
          return Center(
            child: CupertinoActivityIndicator(),
          );
        }
        if (state.countriesState == Status.success) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: state.countries.length,
            itemBuilder: (context, index) {
              final item = state.countries[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: CardCountry(
                  item: item,
                ),
              );
            },
          );
        }
        return Container();
      },
    );
  }
}
