import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/app/presentation/app_bloc/app_bloc.dart';

class ThemeExpansionTile extends StatelessWidget {
  const ThemeExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = context.read<AppBloc>();
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (context, state) {
        ThemeMode themeMode = state.themeMode;
        return ExpansionTile(
          title: const Text('Theme'),
          children: [
            RadioListTile<ThemeMode>(
                title: const Text("System"),
                value: ThemeMode.system,
                groupValue: themeMode,
                onChanged: (value) {
                  appBloc.add(AppEvent.changeTheme(themeMode: value!));
                }),
            RadioListTile<ThemeMode>(
                title: const Text("Dark"),
                value: ThemeMode.dark,
                groupValue: themeMode,
                onChanged: (value) {
                  appBloc.add(AppEvent.changeTheme(themeMode: value!));
                }),
            RadioListTile<ThemeMode>(
                title: const Text("Light"),
                value: ThemeMode.light,
                groupValue: themeMode,
                onChanged: (value) {
                  appBloc.add(AppEvent.changeTheme(themeMode: value!));
                }),
          ],
        );
      },
    );
  }
}
