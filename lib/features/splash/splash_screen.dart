// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/constants/image_constants.dart';
import 'package:pokedex/constants/shared_preferences_constants.dart';
import 'package:pokedex/core/di/shared_export.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_button.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';

extension AnimationControllerX on AnimationController {
  Animation<T> curvedTweenAnimation<T>({required T begin, required T end}) {
    return Tween<T>(begin: begin, end: end).animate(CurvedAnimation(
      curve: Curves.easeInOut,
      parent: this,
    ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerPokeball;
  late AnimationController _controllerContent;
  late Animation _sizeAnimationPokeball;
  late Animation _sizeAnimationContent;
  bool isDownload = false;
  double padding = 0;

  bool _animateText = false;
  bool _animateButton1 = false;
  bool _animateButton2 = false;

  @override
  void initState() {
    _controllerPokeball = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _controllerContent = AnimationController(
        duration: const Duration(milliseconds: 300), vsync: this);

    _sizeAnimationPokeball = Tween<double>(begin: 0, end: 200).animate(
        CurvedAnimation(
            parent: _controllerPokeball, curve: Curves.easeInToLinear));
    _sizeAnimationContent = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: _controllerContent, curve: Curves.easeInToLinear));

    _controllerPokeball.addListener(() {
      setState(() {});
    });
    _controllerContent.addListener(() {
      setState(() {});
    });

    start();
    super.initState();
  }

  start() async {
    await checkDownload();
    await _controllerPokeball.forward();
    await startAnimation();
    await Future.delayed(const Duration(milliseconds: 2500));
    if (!isDownload) {
      await context.read<PokemonCubit>().restorePokemon();
    }
  }

  checkDownload() async {
    final result = await sharedPrefsService.getValue<String>(kGen1);
    if (result == null) {
      setState(() {
        isDownload = true;
      });
    }
  }

  startAnimation() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        _animateText = true;
      });
    });

    Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _animateButton1 = true;
      });
    });

    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        _animateButton2 = true;
      });
    });
  }

  @override
  void dispose() {
    _controllerPokeball.dispose();
    _controllerContent.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonCubit, PokemonState>(
      listener: (context, state) {
        if (state.downloadStatus == Status.success ||
            state.restorePokemonStatus == Status.success) {
          context.read<TypeCubit>().generateTypes(state.allPokemons);
          context.go(ScreenPaths.home);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: _sizeAnimationContent.value),
                child: Align(
                  alignment: Alignment.center,
                  child: Center(
                    child: SizedBox(
                      width: _sizeAnimationPokeball.value,
                      child: Transform.rotate(
                        angle:
                            _controllerPokeball.value * 2.0 * 3.141592653589793,
                        child: GestureDetector(
                          onTap: () {
                            _controllerPokeball.reset();
                            _controllerPokeball.forward();
                          },
                          child: Image.asset(kImgPokeball),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (isDownload) ...[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateText ? 70 : -250,
                  bottom: 250,
                  child: MyText.labelSmall(
                    context: context,
                    text: 'Per continuare devi scaricare i dati',
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateButton1 ? 100 : -250,
                  bottom: 180,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: MyButton(
                      onPress: () {
                        context.read<PokemonCubit>().downloadPokemon();
                      },
                      text: 'Continua',
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateButton2 ? 100 : -250,
                  bottom: 120,
                  child: SizedBox(
                    width: 200,
                    height: 50,
                    child: MyButton(
                      onPress: () {},
                      text: 'Chiudi',
                    ),
                  ),
                ),
              ],
              if (!isDownload)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateText ? 110 : -250,
                  bottom: 200,
                  child: Row(
                    children: [
                      MyText.labelSmall(
                        context: context,
                        text: 'Caricamento...',
                      ),
                      SizedBox(
                        width: 100,
                        height: 100,
                        child: Image.asset(
                          'assets/images/pika_loader.gif',
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}









//  Padding(
//                     padding:
//                         EdgeInsets.only(top: _sizeAnimationContent.value * 240),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Opacity(
//                         opacity: _sizeAnimationContent.value,
//                         child: MyText.labelSmall(
//                           context: context,
//                           text: 'Per continuare devi scaricare i dati',
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(top: _sizeAnimationContent.value * 330),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Opacity(
//                         opacity: _sizeAnimationContent.value,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 40),
//                           child: MyButton(text: 'Continua', onPress: () {}),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding:
//                         EdgeInsets.only(top: _sizeAnimationContent.value * 420),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Opacity(
//                         opacity: _sizeAnimationContent.value,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 40),
//                           child: MyButton(text: 'Chiudi', onPress: () {}),
//                         ),
//                       ),
//                     ),
//                   )