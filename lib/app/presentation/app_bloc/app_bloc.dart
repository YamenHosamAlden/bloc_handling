import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myproject/app/domain/repositories/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';
part 'app_bloc.freezed.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppRepository appRepository;
  AppBloc({required this.appRepository})
      : super(AppState.initial(
          themeMode: appRepository.getThemeMode,
          locale: appRepository.getLanguage,
        )) {
    on<AppEvent>((event, emit) async {
      await event.map(
        changeTheme: (value) async {
          await appRepository.changeThemeMode(value.themeMode);
          emit(
            state.copyWith(themeMode: value.themeMode),
          );
        },
        changeLanguage: (value) async {
          await appRepository.changeLanguage(value.locale);
          emit(
            state.copyWith(locale: value.locale),
          );
        },
      );
    });
  }
}
