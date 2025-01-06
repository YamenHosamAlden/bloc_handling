part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
  }) = _AppState;

  factory AppState.initial({required ThemeMode themeMode}) =>
      AppState(themeMode: themeMode);
}
