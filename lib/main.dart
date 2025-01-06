import 'package:myproject/app/presentation/view/app.dart';
import 'package:myproject/dependency_injections.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const App());
}
