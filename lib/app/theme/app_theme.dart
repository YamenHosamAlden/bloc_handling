import 'package:flutter/material.dart';
import 'package:myproject/core/constans/app_colors.dart';

enum AppThemeData {
  lightTheme,
  darkTheme,
}

class AppTheme {
  static Map<AppThemeData, ThemeData> theme = {
    AppThemeData.lightTheme: _buildLightTheme(),
    AppThemeData.darkTheme: _buildDarkTheme(),
  };

  static const ColorScheme _colorSchemeLight = ColorScheme.light();
  static const ColorScheme _colorSchemeDark = ColorScheme.dark();
  static ThemeData _buildLightTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);

    final TextTheme textTheme = _buildTextTheme(
      base.textTheme,
      AppThemeData.lightTheme,
    );

    return base.copyWith(
      brightness: Brightness.light,
      primaryColorLight: AppColors.lightPrimaryColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      colorScheme: _colorSchemeLight,
      textTheme: textTheme,
    );
  }

  static ThemeData _buildDarkTheme() {
    final ThemeData base = ThemeData.dark(useMaterial3: true);

    final TextTheme textTheme = _buildTextTheme(
      base.textTheme,
      AppThemeData.darkTheme,
    );

    return base.copyWith(
      brightness: Brightness.light,
      primaryColorDark: AppColors.darkPrimaryColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      colorScheme: _colorSchemeDark,
      textTheme: textTheme,
    );
  }

  static TextTheme _buildTextTheme(
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
        fontWeight: FontWeight.w400,
      ),
      labelMedium: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
      labelSmall: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
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
