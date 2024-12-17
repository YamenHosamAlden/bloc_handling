import 'package:statemanagement/app/app.dart';
import 'package:statemanagement/dependency_Injections.dart';

import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await init();
  runApp(const App());
}
