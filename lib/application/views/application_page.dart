import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/bloc/application_bloc.dart';
import 'package:pokedex/countries/cubit/countries_cubit.dart';
import 'package:pokedex/favorite/cubit/favorites_cubit.dart';
import 'package:pokedex/pokemon/cubit/all_data_pokemons_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';

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
  late AnimationController _controller;
  late Animation<double> _sizeAnimation1;
  late Animation<double> _sizeAnimation2;
  late Animation<double> _sizeAnimation3;
  late Animation<double> _sizeAnimation4;
  late Animation<double> _sizeAnimation5;
  late Animation<double> _sizeAnimation6;
  late Animation<double> _sizeAnimation7;
  late Animation<double> _sizeAnimation8;
  late Animation<double> _sizeAnimationWallpaper;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    // await Future.delayed(Duration(milliseconds: 300));
    _sizeAnimationWallpaper = Tween<double>(
      begin: 0.0,
      end: 10.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0, 0.2),
      ),
    );

    _sizeAnimation1 = Tween<double>(
      begin: 0.0,
      end: 240.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.11, 0.22),
      ),
    );

    _sizeAnimation2 = Tween<double>(
      begin: 0.0,
      end: 320.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.22, 0.33),
      ),
    );

    _sizeAnimation3 = Tween<double>(
      begin: 0.0,
      end: 320.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.33, 0.44),
      ),
    );

    _sizeAnimation4 = Tween<double>(
      begin: 0.0,
      end: 210.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.44, 0.55),
      ),
    );

    _sizeAnimation5 = Tween<double>(
      begin: 0.0,
      end: 360.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.55, 0.66),
      ),
    );

    _sizeAnimation6 = Tween<double>(
      begin: 0.0,
      end: 240.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.66, 0.77),
      ),
    );

    _sizeAnimation7 = Tween<double>(
      begin: 0.0,
      end: 160.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(0.77, 0.88),
      ),
    );

    final size = MediaQuery.of(context).size.width;

    _sizeAnimation8 = Tween<double>(
      begin: 0.0,
      end: size,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.88,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    await _controller.forward();
    if (mounted) {
      context.read<ApplicationBloc>().add(ApplicationStart());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        return _buildScaffold(state);
      },
      listenWhen: (previous, current) {
        return previous is! ApplicationReady && current is ApplicationReady;
      },
      listener: (context, state) async {
        context.read<AllDataPokemonsCubit>().fetchAllData();
        context.read<CountriesCubit>().fetchCountries();
        context.read<FavoritesCubit>().fetchFavorites();
        context.go(ScreenPaths.home);
      },
    );
  }

  Widget _buildScaffold(ApplicationState state) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/wallpaper_2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: _sizeAnimationWallpaper.value,
                      sigmaY: _sizeAnimationWallpaper.value,
                    ),
                    child: Container(
                      color: Colors.black.withOpacity(0),
                    ),
                  );
                },
              ),
            ),
            // bulbasaur
            Positioned(
              top: 200,
              right: 105,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation7.value,
                    height: _sizeAnimation7.value,
                    child: Image.asset(
                      'assets/images/bulbasaur.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // lapras
            Positioned(
              top: 150,
              left: -70,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation5.value,
                    height: _sizeAnimation5.value,
                    child: Image.asset(
                      'assets/images/lapras.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // voltorb
            Positioned(
              bottom: -70,
              right: -30,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation4.value,
                    height: _sizeAnimation4.value,
                    child: Image.asset(
                      'assets/images/voltorb.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // gengar
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 390, left: 80),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return SizedBox(
                      width: _sizeAnimation3.value,
                      height: _sizeAnimation3.value,
                      child: Image.asset(
                        'assets/images/gengar.png',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
            ),
            // cyndaquil
            Positioned(
              bottom: -50,
              left: -70,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation1.value,
                    height: _sizeAnimation1.value,
                    child: Image.asset(
                      'assets/images/cyndaquil.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // eevee
            Positioned(
              top: 170,
              right: -70,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation6.value,
                    height: _sizeAnimation6.value,
                    child: Image.asset(
                      'assets/images/eevee.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // pikachu
            Positioned(
              bottom: 60,
              right: -170,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation2.value,
                    height: _sizeAnimation2.value,
                    child: Image.asset(
                      'assets/images/pikachu.png',
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            // pokemon logo
            Align(
              alignment: Alignment.center,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return SizedBox(
                    width: _sizeAnimation8.value,
                    child: Image.asset(
                      'assets/images/pokemon_logo.png',
                    ),
                  );
                },
              ),
            ),

            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black87,
                      Colors.black54,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: state is ApplicationBooting
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/pika_loader.gif'),
                          SizedBox(width: 10),
                          MyText.labelMedium(
                            context: context,
                            text: 'Loading . . .',
                            isFontBold: true,
                          ),
                        ],
                      )
                    : Container(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
