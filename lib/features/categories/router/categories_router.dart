import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/categories/presentation/view/categories_screen.dart';

final StatefulShellBranch categoriesShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      name: RouteName.categoriesRouteName,
      path: RoutePath.categoriesRoutePath,
      builder: (context, state) => const CategoriesScreen(),
    ),
  ],
);
