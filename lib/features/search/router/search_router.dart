import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/search/presentation/view/search_details.dart';
import 'package:myproject/features/search/presentation/view/search_screen.dart';

final StatefulShellBranch searchShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
        name: RouteName.searchRouteName,
        path: RoutePath.searchRoutePath,
        builder: (context, state) => const SearchScreen(),
        routes: [
          GoRoute(
            name: RouteName.searchDetailsRouteName,
            path: "${RoutePath.searchDetailsRoutePath}/:title",
            builder: (context, state) => SearchDetails(
              title: state.pathParameters['title'] as String,
            ),
          ),
        ]),
  ],
);
