import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      // Colore della barra di navigazione (area in basso)
      systemNavigationBarColor: Color(0xff111418), // Cambia a nero
      systemNavigationBarIconBrightness:
          Brightness.light, // Colore delle icone (se visibili)
    ),
  );
  runApp(const App());
}
