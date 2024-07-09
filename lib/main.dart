import 'package:flutter/material.dart';
import 'package:pokedex/bootstrap.dart';
import 'package:pokedex/pokemon/cubit/pokemon_cubit.dart';
import 'package:pokedex/route/go_router_config.dart';
import 'package:pokedex/theme/app_theme.dart';
import 'package:pokedex/type/cubit/type_cubit.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
  runApp(const WrapperProviders());
}

class WrapperProviders extends StatelessWidget {
  const WrapperProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonCubit()),
        BlocProvider(create: (context) => TypeCubit()),
      ],
      child: const _MyApp(),
    );
  }
}

class _MyApp extends StatelessWidget {
  const _MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: AppTheme().toThemeData().copyWith(
                pageTransitionsTheme: const PageTransitionsTheme(
                  builders: {
                    TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                  },
                ),
              ),
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
