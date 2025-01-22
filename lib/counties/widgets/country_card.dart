import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/card_fade_animations.dart';
import 'package:pokedex/components/widgets/card_scaled.dart';
import 'package:pokedex/counties/models/country_model.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

class CardCountry extends StatelessWidget {
  const CardCountry({
    super.key,
    required this.item,
  });

  final CountryModel item;

  @override
  Widget build(BuildContext context) {
    return CardFadeTransition(
      child: CardScaled(
        onPress: () {
          context.push(ScreenPaths.pokemonCountries, extra: item.gen);
        },
        decorationCard: BoxDecoration(
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
                    imageUrl: item.image,
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
                          text: item.description,
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
    );
  }
}
