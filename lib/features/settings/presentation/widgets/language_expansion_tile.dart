import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/app/presentation/app_bloc/app_bloc.dart';

class LanguageExpansionTile extends StatelessWidget {
  const LanguageExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = context.read<AppBloc>();
    return BlocBuilder<AppBloc, AppState>(
      bloc: appBloc,
      builder: (context, state) {
        Locale locale = state.locale;
        return ExpansionTile(
          title: const Text('Language'),
          children: [
            RadioListTile<Locale>(
                title: const Text("English"),
                value: const Locale('en'),
                groupValue: locale,
                onChanged: (value) {
                  appBloc.add(AppEvent.changeLanguage(locale: value!));
                }),
            RadioListTile<Locale>(
                title: const Text("Arabic"),
                value: const Locale('ar'),
                groupValue: locale,
                onChanged: (value) {
                  appBloc.add(AppEvent.changeLanguage(locale: value!));
                }),
          ],
        );
      },
    );
  }
}
