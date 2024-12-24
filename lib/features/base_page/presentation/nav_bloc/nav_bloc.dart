import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nav_event.dart';
part 'nav_state.dart';
part 'nav_bloc.freezed.dart';

class NavBloc extends Bloc<NavEvent, NavState> {
  NavBloc() : super(NavState.initial()) {
    on<NavEvent>((event, emit) {
      event.map(
        changePageIndex: (value) {
          if (value.newPageIndex != state.pageIndex) {
           
            emit(state.copyWith(pageIndex: value.newPageIndex));
          } else {
            state.navigatorKeys[value.newPageIndex]?.currentState!
                .popUntil((route) => route.isFirst);
          }
        },
      );
    });
  }
}
