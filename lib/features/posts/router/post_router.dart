import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/home/presentation/view/home_screen.dart';

StatefulShellBranch postShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      name: RouteName.homeRouteName,
      path: RoutePath.homeRoutePath,
      builder: (context, state) => HomeScreen(
        title: state.extra as String,
      ),
    ),
  ],
);
