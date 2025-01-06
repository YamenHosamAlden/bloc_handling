import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/app/routers/route_info.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushNamed(
              RouteName.searchDetailsRouteName,
              pathParameters: {'title': 'Search Details'},
            );
          },
          child: const Text("Search"),
        ),
      ),
    );
  }
}
