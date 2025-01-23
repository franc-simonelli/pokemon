import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  ThemeData toThemeDataDark() {
    return ThemeData(
      colorSchemeSeed: Colors.blue,
      brightness: Brightness.dark,
      useMaterial3: true,
    ).copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData(
          brightness: Brightness.dark,
          // colorScheme: ColorScheme.fromSeed(
          //   // brightness: Brightness.light,
          //   seedColor: Colors.deepPurple,
          // ),
        ).textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 24.sp,
              ),
              titleMedium: TextStyle(
                fontSize: 20.sp,
              ),
              titleSmall: TextStyle(
                fontSize: 16.sp,
              ),
              labelLarge: TextStyle(
                fontSize: 18.sp,
              ),
              labelMedium: TextStyle(
                fontSize: 16.sp,
              ),
              labelSmall: TextStyle(
                fontSize: 14.sp,
              ),
            ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            40,
          ),
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(
        elevation: 0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
