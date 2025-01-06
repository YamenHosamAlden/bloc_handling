import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/constans/app_colors.dart';

class NavBarWidget extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const NavBarWidget({super.key, required this.navigationShell});
  void _onDestinationSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: [
        const NavigationDestination(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Badge.count(
            backgroundColor: AppColors.mojoColor,
            textColor: Colors.white,
            textStyle: Theme.of(context).textTheme.bodySmall,
            count: 0,
            child: const Icon(
              Icons.shopping_cart,
            ),
          ),
          label: 'Cart',
        ),
        const NavigationDestination(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      selectedIndex: navigationShell.currentIndex,
      onDestinationSelected: _onDestinationSelected,
    );
  }
}
