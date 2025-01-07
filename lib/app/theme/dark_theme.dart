import 'package:flutter/material.dart';
import 'package:myproject/app/theme/app_theme.dart';
import 'package:myproject/app/theme/text_theme.dart';
import 'package:myproject/core/constans/app_colors.dart';

class DarkThemeMode {
  static ThemeData buildDarkTheme() {
    final ThemeData base = ThemeData.dark(useMaterial3: true);
    final TextTheme textTheme = TextThemeMode.buildTextTheme(
      base.textTheme,
      AppThemeData.darkTheme,
    );
    const IconThemeData iconThemeData =
        IconThemeData(color: AppColors.darkWhiteColor);

    return base.copyWith(
      brightness: Brightness.dark,
      primaryColorDark: AppColors.darkPrimaryColor,
      scaffoldBackgroundColor: AppColors.darkScaffoldBackgroundColor,
      cardColor: AppColors.darkCardColor,
      iconTheme: iconThemeData,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.darkPrimaryColor,
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.mojoColor,
        textColor: AppColors.whiteColor,
        textStyle: textTheme.bodySmall,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.darkPrimaryColor,
        indicatorColor: AppColors.darkWhiteColor,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return iconThemeData.copyWith(color: AppColors.darkPrimaryColor);
            }
            return iconThemeData;
          },
        ),
        labelTextStyle: MaterialStatePropertyAll(
          textTheme.labelSmall?.copyWith(color: AppColors.darkWhiteColor),
        ),
      ),
      expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(),
      ),
      textTheme: textTheme,
    );
  }
}
