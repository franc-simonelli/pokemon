import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:pokedex/application/bloc/application_bloc.dart';
import 'package:pokedex/application/repositories/application_repository.dart';
import 'package:pokedex/countries/repositories/countries_repository.dart';
import 'package:pokedex/countries/cubit/countries_cubit.dart';
import 'package:pokedex/other_informations/repository/moveset_repository.dart';
import 'package:pokedex/pokemon/cubit/all_data_pokemons_cubit.dart';
import 'package:pokedex/pokemon/repository/pokemon_repository.dart';
import 'package:pokedex/route/go_router_config.dart';
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
  late ApplicationRepository applicationRepository;
  late PokemonRepository pokemonRepository;
  late FiltersRepository filtersRepository;
  late MovesetRepository movesetRepository;
  late CountriesRepository countriesRepository;
  Timer? _inactivityTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    applicationRepository = ApplicationRepository();
    pokemonRepository = PokemonRepository();
    filtersRepository = FiltersRepository();
    movesetRepository = MovesetRepository();
    countriesRepository = CountriesRepository();
    allDataPokemonsCubit = AllDataPokemonsCubit(
      pokemonRepository: pokemonRepository,
    );
    countriesCubit = CountriesCubit(
      countriesRepository: countriesRepository,
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
        BlocProvider<ApplicationBloc>(
          create: (context) {
            applicationBloc = ApplicationBloc(
              applicationRepository: applicationRepository,
            );
            return applicationBloc!;
          },
        ),
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
