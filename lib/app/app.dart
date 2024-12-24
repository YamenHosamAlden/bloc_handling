import 'package:statemanagement/app/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement/features/base_page/presentation/view/pages/base_page.dart';
import 'package:statemanagement/features/posts/presentation/view/post_page.dart';

class App extends StatelessWidget {
  const App({super.key});
 static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      navigatorKey:navigatorKey ,
      theme: appThemeData[AppTheme.lightTheme],
      home: BasePage(),
    );
  }
}
