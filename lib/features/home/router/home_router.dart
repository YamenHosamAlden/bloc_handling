import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/home/presentation/view/home_screen.dart';

StatefulShellBranch homeShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      name: RouteName.homeRouteName,
      path: RoutePath.homeRoutePath,
      builder: (context, state) => const HomeScreen(),
    ),
  ],
);
