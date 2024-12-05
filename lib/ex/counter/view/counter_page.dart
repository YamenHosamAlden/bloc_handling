import 'package:blocstatemangement/ex/counter/bloc/counter_bloc.dart';
import 'package:blocstatemangement/ex/counter/cubit/counter_cubit.dart';
import 'package:blocstatemangement/ex/counter/view/counter_view_with_bloc.dart';
import 'package:blocstatemangement/ex/counter/view/counter_view_with_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class CounterPageWithCubit extends StatelessWidget {

  const CounterPageWithCubit({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterViewWithCubit(),
    );
  }
}


class CounterPageWithBloc extends StatelessWidget {

  const CounterPageWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: const CounterViewWithBloc(),
    );
  }
}