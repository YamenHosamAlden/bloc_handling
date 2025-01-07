import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';
import 'package:myproject/features/posts/presentation/view/post_page.dart';

StatefulShellBranch postShellBranch = StatefulShellBranch(
  routes: [
    GoRoute(
      name: RouteName.postRouteName,
      path: RoutePath.postRoutePath,
      builder: (context, state) => const PostPage(),
    ),
  ],
);
