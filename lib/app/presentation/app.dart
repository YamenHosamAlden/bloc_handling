import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myproject/app/lang/app_localization.dart';
import 'package:myproject/app/presentation/app_bloc/app_bloc.dart';
import 'package:myproject/app/routers/routers.dart';
import 'package:myproject/app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:myproject/dependency_injections.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => di<AppBloc>(),
        child: const AppView(),
      );
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
          child: MaterialApp.router(
            routerConfig: appRouter,
            title: '',
            
            themeMode: state.themeMode,
            theme: AppTheme.theme[AppThemeData.lightTheme],
            darkTheme: AppTheme.theme[AppThemeData.darkTheme],
            locale: state.locale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
          ),
        );
      },
    );
  }
}
