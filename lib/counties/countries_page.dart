import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/counties/cubit/countries_cubit.dart';
import 'package:pokedex/counties/models/country_model.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/pokemon/widget/grid_pokemon.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText.labelLarge(
          context: context,
          text: 'Countries',
          isFontBold: true,
        ),
      ),
      body: BlocBuilder<CountriesCubit, CountriesState>(
        builder: (context, state) {
          if (state.countriesState == Status.loading) {
            return Center(
              child: CupertinoActivityIndicator(),
            );
          }
          if (state.countriesState == Status.success) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.countries.length,
              itemBuilder: (context, index) {
                final item = state.countries[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardCountry(
                    item: item,
                  ),
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}

class CardCountry extends StatefulWidget {
  const CardCountry({
    super.key,
    required this.item,
  });

  final CountryModel item;

  @override
  State<CardCountry> createState() => _CardCountryState();
}

class _CardCountryState extends State<CardCountry> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(ScreenPaths.pokemonCountries, extra: widget.item.gen);
      },
      onTapDown: (_) {
        setState(() {
          _isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isPressed = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isPressed = false;
        });
      },
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: _isPressed ? 0.7 : 1,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          curve: Curves.easeInOut,
          transform: _isPressed
              ? Matrix4.identity().scaled(0.90, 0.90, 0.40)
              : Matrix4.identity(),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(-1, -1),
                blurRadius: 1,
              ),
              const BoxShadow(
                color: Colors.black,
                offset: Offset(2, 2),
                blurRadius: 2,
              )
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      imageUrl: widget.item.image,
                      imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) => const Center(
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black54,
                            Colors.black87,
                          ],
                          stops: [
                            0.1,
                            0.4,
                            1,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyText.labelLarge(
                            context: context,
                            text: widget.item.description,
                            isFontBold: true,
                            isBorderText: true,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
