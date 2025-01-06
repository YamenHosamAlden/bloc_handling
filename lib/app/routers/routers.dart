import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/auth/router/auth_router.dart';
import 'package:myproject/features/base_page/view/base_page.dart';
import 'package:myproject/features/cart/router/cart_router.dart';
import 'package:myproject/features/home/router/home_router.dart';
import 'package:myproject/features/settings/router/settings_router.dart';
import 'package:myproject/features/search/router/search_router.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();
// GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>();
final GoRouter appRouter = GoRouter(
  initialLocation: RoutePath.loginRoutePath,
  navigatorKey: rootNavigatorKey,
  routes: [
    authRoute,
    StatefulShellRoute.indexedStack(
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state, navigationShell) =>
          BasePage(navigationShell: navigationShell),
      branches: [
        homeShellBranch,
        searchShellBranch,
        cartShellBranch,
        settingsShellBranch
      ],
    ),
  ],
);
