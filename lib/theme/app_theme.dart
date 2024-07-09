import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  ThemeData toThemeData() {
    return ThemeData(
      colorSchemeSeed: Colors.deepPurple,
      brightness: Brightness.dark,
      useMaterial3: true,
    ).copyWith(
      // splashColor: Colors.transparent,
      // highlightColor: Colors.transparent,
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
                fontSize: 14.sp,
              ),
              labelMedium: TextStyle(
                fontSize: 12.sp,
              ),
              labelSmall: TextStyle(
                fontSize: 10.sp,
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
    );
  }
}
