import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/bloc/application_bloc.dart';
import 'package:pokedex/constants/image_constants.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_button.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/filters/cubit/filters_cubit.dart';

class ApplicationPage extends StatefulWidget {
  const ApplicationPage({super.key});

  static MaterialPageRoute<dynamic> route() {
    return MaterialPageRoute(builder: (context) => const ApplicationPage());
  }

  @override
  State<ApplicationPage> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with TickerProviderStateMixin {
  late AnimationController _controllerPokeball;
  late AnimationController _controllerContent;
  late Animation _sizeAnimationPokeball;
  late Animation _sizeAnimationContent;
  late ApplicationBloc applicationBloc;
  double padding = 0;
  bool _animateText = false;
  bool _animateButton1 = false;
  bool _animateButton2 = false;
  Widget? widgetContent;
  ApplicationState? _previousState;

  @override
  void initState() {
    applicationBloc = context.read<ApplicationBloc>();
    // sharedPrefsService.removeValue(kGen1);
    // sharedPrefsService.removeValue(kGen2);
    // sharedPrefsService.removeValue(kGen3);
    // sharedPrefsService.removeValue(kGen4);
    // sharedPrefsService.removeValue(kGen5);
    // sharedPrefsService.removeValue(kGen6);
    // sharedPrefsService.removeValue(kGen7);

    _initializeAnimation();
    super.initState();
  }

  void _initializeAnimation() {
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

    _start();
  }

  _start() async {
    await _controllerPokeball.forward();
    applicationBloc.add(const ApplicationStart());
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
  Widget build(BuildContext context) {
    return BlocConsumer<ApplicationBloc, ApplicationState>(
      buildWhen: (previous, current) {
        // When both previous and current are ApplicationReady then there is
        // no needs to rebuild the app. It would happen only because the
        // app paused or resumed (app goes background or foreground).
        return !(previous is ApplicationReady && current is ApplicationReady);
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
              if (state is ApplicationDownloadRequired) ...[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateText ? 75 : -250,
                  bottom: 250,
                  child: MyText.labelSmall(
                    context: context,
                    text: 'Per continuare devi scaricare i dati',
                    isFontBold: true,
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
                        context
                            .read<ApplicationBloc>()
                            .add(ApplicationDownload());
                      },
                      text: 'Download',
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  left: _animateButton2 ? 170 : -250,
                  bottom: 130,
                  child: MyText.labelSmall(
                    context: context,
                    text: 'Annulla',
                  ),
                ),
              ],
              if (state is ApplicationDownloading)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 240),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyText.labelSmall(
                          context: context,
                          text: 'Download in corso...',
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          child: Image.asset(
                            'assets/images/pika_loader.gif',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
      // listenWhen: (previous, current) {
      //   // Replace with tabs only the first time app is ready
      //   return previous is! ApplicationReady && current is ApplicationReady;
      // },
      listener: (context, state) async {
        if (_previousState is! ApplicationReady && state is ApplicationReady) {
          context.read<PokemonCubit>().init();
          context.read<FiltersCubit>().fetchFilters();
          context.go(ScreenPaths.home);
        }

        if (state is ApplicationDownloadRequired) {
          startAnimation();
        }
        _previousState = state;
      },
    );
  }
}
