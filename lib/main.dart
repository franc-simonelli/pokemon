import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false, // <--- importante
    systemNavigationBarIconBrightness: Brightness.dark, // o light
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  runApp(const App());
}
