import 'package:blocstatemangement/app/app.dart';
import 'package:blocstatemangement/dependency_Injections.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const App());
}
