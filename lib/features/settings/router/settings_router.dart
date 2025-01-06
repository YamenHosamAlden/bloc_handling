import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/settings/presentation/view/settings_screen.dart';



final StatefulShellBranch settingsShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
        name: RouteName.settingsRouteName,
        path: RoutePath.settingsRoutePath,
        builder: (context, state) => const SettingsScreen(),)
      
  ],
);
