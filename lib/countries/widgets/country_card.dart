import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/components/widgets/card_fade_animations.dart';
import 'package:pokedex/components/widgets/card_scaled.dart';
import 'package:pokedex/countries/models/country_model.dart';
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
              color: Colors.black,
              offset: const Offset(0, 3),
              blurRadius: 1,
            ),
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
                Positioned.fill(
                  child: CustomPaint(
                    painter: MetallicEffectPainter(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MetallicEffectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Crea un gradiente iridescente
    final gradient = LinearGradient(
      colors: [
        // Colors.black26,
        // Colors.black.withOpacity(0.3),
        // Colors.black54,
        // Colors.black26,
        Colors.grey.shade300,
        Colors.white.withOpacity(0.6),
        Colors.grey.shade500,
        Colors.grey.shade300,
      ],
      stops: [0.0, 0.5, 0.8, 1.0],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final paint = Paint()
      ..shader = gradient.createShader(Offset.zero & size)
      ..blendMode = BlendMode.darken;

    // Aggiungi un livello di blur per la superficie lucida
    final blurPaint = Paint()
      ..color = Colors.white.withOpacity(0.2)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 8);

    // Disegna i vari strati
    canvas.drawRect(Offset.zero & size, blurPaint);
    canvas.drawRect(Offset.zero & size, paint);

    // Aggiungi riflessi casuali
    final lightPaint = Paint()..color = Colors.white.withOpacity(0.1);
    canvas.drawCircle(
        Offset(size.width * 0.3, size.height * 0.2), 20, lightPaint);
    canvas.drawCircle(
        Offset(size.width * 0.7, size.height * 0.8), 15, lightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
