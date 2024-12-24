import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/features/base_page/presentation/nav_bloc/nav_bloc.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) => NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Posts',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        selectedIndex: state.pageIndex.index,
      
        onDestinationSelected: (newIndex) => context
            .read<NavBloc>()
            .add(NavEvent.changePageIndex(PageIndex.values[newIndex])),
       
      ),
    );
  }
}
