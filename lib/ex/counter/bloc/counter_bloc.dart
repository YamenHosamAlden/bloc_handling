import 'package:bloc/bloc.dart';

sealed class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementEvent>((event, emit) => emit(state + 1));
    on<DecrementEvent>((event, emit) {
      if (state != 0) {
        emit(state - 1);
      }
    });
  }

  @override
  void onChange(Change<int> change) {
    super.onChange(change);
    print("$change");
  }
}
