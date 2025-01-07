import 'package:flutter/material.dart';
import 'package:myproject/app/theme/app_theme.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(
    TextTheme base,
    AppThemeData appTheme,
  ) {
    return base.copyWith(
      displayLarge: const TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
      ),
      displayMedium: const TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
      ),
      displaySmall: const TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w400,
      ),
      headlineLarge: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: const TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
      ),
      titleLarge: const TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      labelLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      bodyMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: const TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
