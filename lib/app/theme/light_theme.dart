import 'package:flutter/material.dart';
import 'package:myproject/app/theme/app_theme.dart';
import 'package:myproject/app/theme/text_theme.dart';
import 'package:myproject/core/constans/app_colors.dart';

class LightThemeMode {
  static ThemeData buildLightTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);

    final TextTheme textTheme = TextThemeMode.buildTextTheme(
      base.textTheme,
      AppThemeData.lightTheme,
    );
    const IconThemeData iconThemeData =
        IconThemeData(color: AppColors.lightWhiteColor);

    return base.copyWith(
      brightness: Brightness.light,
      primaryColorLight: AppColors.lightPrimaryColor,
      scaffoldBackgroundColor: AppColors.lightScaffoldBackgroundColor,
      cardColor: AppColors.darkCardColor,
      colorScheme:
          const ColorScheme.light(primary: AppColors.lightPrimaryColor),
      iconTheme: iconThemeData,
      expansionTileTheme: const ExpansionTileThemeData(
        shape: Border(),
      ),
      badgeTheme: BadgeThemeData(
        backgroundColor: AppColors.mojoColor,
        textColor: AppColors.whiteColor,
        textStyle: textTheme.bodySmall,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.lightPrimaryColor,
        indicatorColor: AppColors.lightWhiteColor,
        iconTheme: MaterialStateProperty.resolveWith<IconThemeData>(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return iconThemeData.copyWith(color: AppColors.lightPrimaryColor);
            }
            return iconThemeData;
          },
        ),
        labelTextStyle: MaterialStatePropertyAll(
          textTheme.labelSmall?.copyWith(color: AppColors.lightWhiteColor),
        ),
      ),
      textTheme: textTheme,
    );
  }
}
