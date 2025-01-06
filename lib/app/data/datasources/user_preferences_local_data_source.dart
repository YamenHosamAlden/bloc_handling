import 'package:shared_preferences/shared_preferences.dart';
import 'package:myproject/core/constans/app_string.dart';

abstract interface class UserPreferencesLocalDataSource {
  Future<void> saveAppThemeMode();
  Future<void> removeAppThemeMode();
  bool get isAppThemeMode;
  Future<void> saveDarkMode();
  Future<void> removeDarkTheme();
  bool get isDarkMode;
}

class UserPreferencesLocalDataSourceImpl
    implements UserPreferencesLocalDataSource {
  final SharedPreferences sharedPreferences;
  UserPreferencesLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> saveAppThemeMode() async =>
      await sharedPreferences.setBool(AppString.appThemeMode, true);

  @override
  Future<void> removeAppThemeMode() async =>
      await sharedPreferences.remove(AppString.appThemeMode);

  @override
  bool get isAppThemeMode =>
      sharedPreferences.getBool(AppString.appThemeMode) ?? false;

  @override
  Future<void> saveDarkMode() async =>
      await sharedPreferences.setBool(AppString.darkMode, true);

  @override
  Future<void> removeDarkTheme() async =>
      await sharedPreferences.remove(AppString.darkMode);

  @override
  bool get isDarkMode => sharedPreferences.getBool(AppString.darkMode) ?? false;
}
