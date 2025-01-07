import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushReplacementNamed(RouteName.homeRouteName);
          },
          child: const Text("Login"),
        ),
      ),
    );
  }
}
