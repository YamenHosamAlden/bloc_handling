import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myproject/app/domain/repositories/user_preferences_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  UserPreferencesRepository userPreferencesRepository;
  AppBloc({required this.userPreferencesRepository})
      : super(AppState.initial(
          themeMode: userPreferencesRepository.getThemeMode,
          locale: userPreferencesRepository.getLanguage,
        )) {
    on<AppEvent>((event, emit) async {
      await event.map(
        changeTheme: (value) async {
          await userPreferencesRepository.changeThemeMode(value.themeMode);
          emit(
            state.copyWith(themeMode: value.themeMode),
          );
        },
        changeLanguage: (value) async {
          await userPreferencesRepository.changeLanguage(value.locale);
          emit(
            state.copyWith(locale: value.locale),
          );
        },
      );
    });
  }
}
