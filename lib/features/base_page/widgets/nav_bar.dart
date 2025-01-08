import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/app/lang/app_localization.dart';

class NavBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavBarWidget({super.key, required this.navigationShell});
  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: navigationShell.currentIndex == index,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        NavigationDestination(
          icon: const Icon(Icons.home),
          label: 'home'.tr(context),
        ),
        NavigationDestination(
          icon: const Icon(Icons.category),
          label: 'categories'.tr(context),
        ),
        NavigationDestination(
          icon: const Icon(Icons.search),
          label: 'search'.tr(context),
        ),
        NavigationDestination(
          icon: Badge.count(
            count: 0,
            child: const Icon(
              Icons.shopping_cart,
            ),
          ),
          label: 'cart'.tr(context),
        ),
        NavigationDestination(
          icon: const Icon(Icons.settings),
          label: 'settings'.tr(context),
        ),
      ],
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onDestinationSelected,
    );
  }
}
