import 'package:flutter/material.dart';
import 'package:pokedex/app.dart';
import 'package:pokedex/bootstrap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await bootstrap();
  runApp(const App());
}
