import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/cart/presentation/view/cart_screen.dart';

final StatefulShellBranch cartShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      name: RouteName.cartRouteName,
      path: RoutePath.cartRoutePath,
      builder: (context, state) => const CartScreen(),
    ),
  ],
);
