import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/dependency_Injections.dart';
import 'package:statemanagement/features/base_page/presentation/nav_bloc/nav_bloc.dart';
import 'package:statemanagement/features/base_page/presentation/view/pages/base_view.dart';

class BasePage extends StatelessWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<NavBloc>(),
      child: const BaseView(),
    );
  }
}
