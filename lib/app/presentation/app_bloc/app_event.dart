part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.changeTheme({required ThemeMode themeMode}) = _ChangeTheme;
}