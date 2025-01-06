import 'package:flutter/material.dart';

abstract interface class UserPreferencesRepository {
  ThemeMode get getThemeMode;

  Future<ThemeMode> changeThemeMode(ThemeMode themeMode);
  Future<void> changeLanguage();
}
