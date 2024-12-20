import 'package:statemanagement/app/app_theme.dart';
import 'package:statemanagement/features/posts/presentation/view/post_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Timer',
      theme: appThemeData[AppTheme.lightTheme],
      home: PostPage(),
    );
  }
}
