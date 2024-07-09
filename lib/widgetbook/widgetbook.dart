import 'package:flutter/material.dart';
import 'package:pokedex/widgetbook/widgetbook.directories.g.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

void main() {
  runApp(const WidgetBookApp());
}

@widgetbook.App()
class WidgetBookApp extends StatelessWidget {
  const WidgetBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      addons: [
        MaterialThemeAddon(
          themes: [
            // WidgetbookTheme(name: 'Light', data: ThemeData()),
            WidgetbookTheme(name: 'Dark', data: ThemeData.dark()),
          ],
        ),
        DeviceFrameAddon(
          devices: [
            Devices.ios.iPhone13ProMax,
            Devices.ios.iPhone13,
            Devices.ios.iPhone13Mini,
          ],
        )
      ],
    );
  }
}
