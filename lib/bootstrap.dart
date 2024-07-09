import 'package:flutter/services.dart';
import 'package:pokedex/core/di/register_dependencies.dart';

bootstrap() async {
  registerDependencies();
  await _setDeviceOrientation();
}

Future _setDeviceOrientation() async {
  final orientations = <DeviceOrientation>[];
  orientations.addAll([
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setPreferredOrientations(orientations);
}
