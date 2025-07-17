import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex/application/bloc/application_bloc.dart';
import 'package:pokedex/application/repositories/application_repository.dart';
import 'package:pokedex/components/widgets/button_scaled.dart';
import 'package:pokedex/components/widgets/download_stream.dart';
import 'package:pokedex/countries/repositories/countries_repository.dart';
import 'package:pokedex/countries/cubit/countries_cubit.dart';
import 'package:pokedex/favorite/cubit/favorites_cubit.dart';
import 'package:pokedex/games/cubit/game_tab_cubit.dart';
import 'package:pokedex/games/widgets/games_tab.dart';
import 'package:pokedex/other_informations/cubit/moveset_cubit.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
import 'package:pokedex/pokemon/cubit/all_data_pokemons_cubit.dart';
import 'package:pokedex/pokemon/models/pokemon_model.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/pokemon/widget/img_pokemon_shadow.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/shared/widget/my_text_widget.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/filters/repository/type_repository.dart';
import 'package:sizer/sizer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with WidgetsBindingObserver {
  // late PokemonCubit pokemonCubit;
  // late FiltersCubit filtersCubit;
  late AllDataPokemonsCubit allDataPokemonsCubit;
  late CountriesCubit countriesCubit;
  ApplicationBloc? applicationBloc;
  late MovesetCubit movesetCubit;
  // late GameTabCubit gamesTabCubit;
  late FavoritesCubit favoritesCubit;
  late ApplicationRepository applicationRepository;
  late PokemonRepository pokemonRepository;
  late FiltersRepository filtersRepository;
  late MovesetRepository movesetRepository;
  late CountriesRepository countriesRepository;
  Timer? _inactivityTimer;
  final GlobalKey<_DraggableBallState> _floatingKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    applicationRepository = ApplicationRepository();
    pokemonRepository = PokemonRepository();
    filtersRepository = FiltersRepository();
    movesetRepository = MovesetRepository();
    countriesRepository = CountriesRepository();
    // gamesTabCubit = GameTabCubit();
    allDataPokemonsCubit = AllDataPokemonsCubit(
      pokemonRepository: pokemonRepository,
    );
    countriesCubit = CountriesCubit(
      countriesRepository: countriesRepository,
    );
    movesetCubit = MovesetCubit(
      movesetRepository: movesetRepository,
      pokemonRepository: pokemonRepository,
      // gameTabCubit: GameTabCubit(),
    );
    favoritesCubit = FavoritesCubit(
      pokemonRepository: pokemonRepository,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    log('Application State: $state');
    switch (state) {
      case AppLifecycleState.resumed:
        {
          applicationBloc?.add(ApplicationResume());
          log('Cancelling inactivity timer');
          _inactivityTimer?.cancel();
          _inactivityTimer = null;
        }
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        {
          applicationBloc?.add(ApplicationPause());
          if (_inactivityTimer == null) {
            log('Starting inactivity timer');
            _inactivityTimer = Timer(const Duration(days: 1), () {
              log('Restarting app due to inactivity');
              Phoenix.rebirth(context);
            });
          }
        }
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
    }
  }

  Widget _buildRepositories({Widget? child}) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApplicationRepository>.value(
          value: applicationRepository,
        ),
        RepositoryProvider<PokemonRepository>.value(
          value: pokemonRepository,
        ),
        RepositoryProvider<FiltersRepository>.value(
          value: filtersRepository,
        ),
        RepositoryProvider<MovesetRepository>.value(
          value: movesetRepository,
        ),
        RepositoryProvider<CountriesRepository>.value(
          value: countriesRepository,
        ),
      ],
      child: child ?? Container(),
    );
  }

  Widget _buildProviders({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AllDataPokemonsCubit>.value(value: allDataPokemonsCubit),
        BlocProvider<CountriesCubit>.value(value: countriesCubit),
        BlocProvider<MovesetCubit>.value(value: movesetCubit),
        BlocProvider<ApplicationBloc>(
          create: (context) {
            applicationBloc = ApplicationBloc(
                applicationRepository: applicationRepository,
                pokemonRepository: pokemonRepository);
            return applicationBloc!;
          },
        ),
        BlocProvider<FavoritesCubit>.value(value: favoritesCubit),
        // BlocProvider<GameTabCubit>.value(value: gamesTabCubit),
      ],
      child: child,
    );
  }

  Widget _buildApp({required BuildContext context}) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().toThemeDataDark(),
          // theme: ThemeData.light(),
          routerConfig: goRouter,
          builder: (context, child) {
            return Stack(
              children: [
                _Unfocus(
                  child: child!,
                ),
                BlocBuilder<MovesetCubit, MovesetState>(
                  builder: (context, state) {
                    if (state.showDownloadIcon) {
                      return DraggableBall(key: _floatingKey);
                    }
                    return const SizedBox.shrink();
                  },
                ),
                // const FullScreenLoadingListener(),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildRepositories(
      child: _buildProviders(
        child: _buildApp(context: context),
      ),
    );
  }
}

class _Unfocus extends StatelessWidget {
  const _Unfocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: child,
      ),
    );
  }
}

class DraggableBall extends StatefulWidget {
  const DraggableBall({Key? key}) : super(key: key);

  @override
  State<DraggableBall> createState() => _DraggableBallState();
}

class _DraggableBallState extends State<DraggableBall> {
  double _top = 100;
  double _left = 100;

  bool openDialog = false;

  @override
  Widget build(BuildContext context) {
    final movesetCubit = context.watch<MovesetCubit>();
    return Positioned(
      top: _top,
      left: _left,
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _top += details.delta.dy;
                  _left += details.delta.dx;
                });
              },
              onTap: () {
                setState(() {
                  openDialog = !openDialog;
                });
              },
              child: StreamBuilder<double>(
                stream: movesetCubit.progressStream,
                builder: (context, snapshot) {
                  final progress = snapshot.data ?? 0.0;
                  var percent = (progress * 100).toStringAsFixed(0);
                  return CustomCircularProgress(
                    value: double.parse(percent),
                    pokemon: movesetCubit.state.pokemon!,
                  );
                },
              ),
            ),
            if (openDialog) ...[
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: MediaQuery.of(context).size.width * 0.7,
                // height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    DownloadStream(
                      stream: movesetCubit.progressStream,
                      closeWindowWhenComplete: false,
                    ),
                    SizedBox(height: 20),
                    StreamBuilder<double>(
                      stream: movesetCubit.progressStream,
                      builder: (context, snapshot) {
                        final progress = snapshot.data ?? 0.0;
                        var percent = (progress * 100).toStringAsFixed(0);
                        if (percent == '100') {
                          return ButtonScaled(
                            child: MyText.labelMedium(
                              context: context,
                              text: 'Vai alla tabella',
                            ),
                            onPress: () {
                              context
                                  .read<MovesetCubit>()
                                  .setShowDownloadIcon(false);
                              context.push(
                                ScreenPaths.tableMoves,
                              );
                            },
                          );
                        }
                        return ButtonScaled(
                          child: MyText.labelMedium(
                            context: context,
                            text: 'Annulla',
                          ),
                          onPress: () {
                            movesetCubit.closeStream();
                            movesetCubit.setShowDownloadIcon(false);
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class CustomCircularProgress extends StatelessWidget {
  final double value;
  final PokemonModel pokemon;

  const CustomCircularProgress(
      {super.key, required this.value, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: CustomPaint(
        painter: _CircularProgressPainter(value),
        child: Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: ImgPokemonShadow(
              pokemon: pokemon,
              imageGif:
                  "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/showdown/${int.parse(pokemon.id!.replaceAll("#", ""))}.gif",
            ),
          ),
        ),
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double value;

  _CircularProgressPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    double strokeWidth = 3;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = (size.width - strokeWidth) / 2;

    // Background circle (grigio)
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.shade100
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Colore dinamico (es. rosso -> verde)
    Color progressColor = Color.lerp(Colors.red, Colors.green, value / 100)!;

    Paint foregroundPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * 3.141592653589793 * (value / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.1416 / 2, // start at top
      sweepAngle,
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(_CircularProgressPainter oldDelegate) {
    return oldDelegate.value != value;
  }
}
