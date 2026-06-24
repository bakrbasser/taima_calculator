import 'package:flutter/material.dart';
import 'package:taima_calculator/source/colors.dart';

TextTheme textTheme(BuildContext context) => Theme.of(context).textTheme;

class AppTheme {
  static const String fontFamily = 'Cairo';

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: fontFamily,

      textTheme: const TextTheme(
        // Display styles
        displayLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 57,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.25,
          color: Colors.black,
        ),
        displayMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 45,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Colors.black,
        ),
        displaySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 36,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: Colors.black,
        ),

        // Headline styles
        headlineLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 32,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),
        headlineSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: Colors.black,
        ),

        // Title styles
        titleLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 22,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: Colors.black,
        ),
        titleMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.15,
          color: Colors.black,
        ),
        titleSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          color: Colors.black,
        ),

        // Label styles
        labelLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Colors.black,
        ),
        labelSmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
          color: Colors.black,
        ),

        // Body styles
        bodyLarge: TextStyle(
          fontFamily: fontFamily,
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.5,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontFamily: fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.25,
          color: Colors.black,
        ),
        bodySmall: TextStyle(
          fontFamily: fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.4,
          color: Colors.black,
        ),
      ),
      // Customize app bar theme
      appBarTheme: const AppBarTheme(
        // centerTitle: true,
        backgroundColor: deepGreen,
        foregroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontFamily: fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.15,
        ),
      ),

      // Customize button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          textStyle: const TextStyle(
            fontFamily: fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
      ),

      colorScheme: ColorScheme.fromSeed(seedColor: deepGreen),

      iconTheme: IconThemeData(color: lightgold),
      dialogTheme: DialogThemeData(backgroundColor: deepGreen),
    );
  }
}
