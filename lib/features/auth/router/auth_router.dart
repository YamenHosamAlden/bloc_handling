import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/auth/presentation/view/login_screen.dart';

GoRoute authRoute = GoRoute(
  path: RoutePath.loginRoutePath,
  name: RouteName.loginRouteName,
  builder: (context, state) => const LoginScreen(),
);
