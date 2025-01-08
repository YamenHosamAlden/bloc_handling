import 'package:flutter/material.dart';
import 'package:myproject/app/theme/app_theme.dart';
import 'package:myproject/core/constans/app_colors.dart';

class TextThemeMode {
  static TextTheme buildTextTheme(
    TextTheme base,
    AppThemeData appTheme,
  ) {
    return base.copyWith(
      displayLarge: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.bold,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      displayMedium: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      displaySmall: TextStyle(
        fontSize: 38,
        fontWeight: FontWeight.w400,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w800,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w600,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      titleMedium: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      labelLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      labelMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      labelSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w800,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: AppThemeData.darkTheme == appTheme
            ? AppColors.darkModeWhiteColor
            : AppColors.lightModeBlackColor,
      ),
    );
  }
}
