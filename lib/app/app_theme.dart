import 'package:statemanagement/core/constans/app_colors.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  lightTheme,
  darkTheme,
}

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.martiniqueColor),
    primaryColor: AppColors.eucalyptusColor,
    scaffoldBackgroundColor: AppColors.alabasterColor,
    primaryColorLight: AppColors.martiniqueColor,
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      backgroundColor: AppColors.eucalyptusColor,
      centerTitle: true,
      elevation: 10,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.altoColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      fillColor: AppColors.whiteColor,
      filled: true,
      contentPadding: const EdgeInsets.all(10),
      prefixIconColor: Colors.grey,
      hintStyle: const TextStyle(
        fontSize: 14,
        height: 1,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.whiteColor),
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.martiniqueColor),
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.martiniqueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.white,
      expansionAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut, reverseCurve: Curves.easeInOut),
      childrenPadding: const EdgeInsets.all(5),
    ),
  ),
  AppTheme.darkTheme: ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(primary: AppColors.martiniqueColor),
    primaryColor: AppColors.eucalyptusColor,
    scaffoldBackgroundColor: AppColors.alabasterColor,
    primaryColorLight: AppColors.martiniqueColor,
    appBarTheme: const AppBarTheme(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
      backgroundColor: AppColors.eucalyptusColor,
      centerTitle: true,
      elevation: 10,
      titleTextStyle: TextStyle(
          color: AppColors.whiteColor,
          fontSize: 18,
          fontWeight: FontWeight.w600),
      iconTheme: IconThemeData(color: AppColors.whiteColor),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.altoColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      fillColor: AppColors.whiteColor,
      filled: true,
      contentPadding: const EdgeInsets.all(10),
      prefixIconColor: Colors.grey,
      hintStyle: const TextStyle(
        fontSize: 14,
        height: 1,
        color: Colors.grey,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.whiteColor),
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.martiniqueColor),
        gapPadding: 0,
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: const TextStyle(fontSize: 14, color: AppColors.whiteColor),
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.martiniqueColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    ),
    listTileTheme: const ListTileThemeData(
      dense: true,
    ),
    expansionTileTheme: ExpansionTileThemeData(
      backgroundColor: Colors.white,
      expansionAnimationStyle: AnimationStyle(
          curve: Curves.easeInOut, reverseCurve: Curves.easeInOut),
      childrenPadding: const EdgeInsets.all(5),
    ),
  ),
};
