
import 'package:flutter/material.dart';
import 'package:myproject/app/data/datasources/user_preferences_local_data_source.dart';
import 'package:myproject/app/domain/repositories/user_preferences_repository.dart';

class UserPreferencesRepositoryImpl implements UserPreferencesRepository {
  UserPreferencesLocalDataSource userPreferencesLocalDataSource;
  UserPreferencesRepositoryImpl({
    required this.userPreferencesLocalDataSource,
  });

  @override
  ThemeMode get getThemeMode {
    if (userPreferencesLocalDataSource.isAppThemeMode) {
      if (userPreferencesLocalDataSource.isDarkMode) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.light;
      }
    } else {
      return ThemeMode.system;
    }
  }

  @override
  Future<ThemeMode> changeThemeMode(ThemeMode themeMode) async {
    if (themeMode == ThemeMode.dark) {
      await userPreferencesLocalDataSource.saveAppThemeMode();
      await userPreferencesLocalDataSource.saveDarkMode();
      return ThemeMode.dark;
    } else if (themeMode == ThemeMode.light) {
      await userPreferencesLocalDataSource.saveAppThemeMode();
      await userPreferencesLocalDataSource.removeDarkTheme();
      return ThemeMode.light;
    } else {
      await userPreferencesLocalDataSource.removeAppThemeMode();
      await userPreferencesLocalDataSource.removeDarkTheme();
      return ThemeMode.system;
    }
  }
  
  @override
  Future<void> changeLanguage() {
    // TODO: implement changeLanguage
    throw UnimplementedError();
  }
}
