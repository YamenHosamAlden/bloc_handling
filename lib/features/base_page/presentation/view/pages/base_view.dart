import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:statemanagement/core/dialogs/confirm_dialog.dart';
import 'package:statemanagement/features/base_page/presentation/nav_bloc/nav_bloc.dart';
import 'package:animations/animations.dart';
import 'package:statemanagement/features/base_page/presentation/view/widgets/nav_bar.dart';
import 'package:statemanagement/features/posts/presentation/view/post_page.dart';

class BaseView extends StatelessWidget {
  const BaseView({super.key});

  void onPopInvokedWithResult(
    BuildContext context,
    bool didPop,
  ) async {
    NavBloc navBloc = BlocProvider.of<NavBloc>(context);
    NavigatorState? currentNavigator =
        navBloc.state.navigatorKeys[navBloc.state.pageIndex]?.currentState;
    bool canPop = navBloc
        .state.navigatorKeys[navBloc.state.pageIndex]!.currentState!
        .canPop();
    if (canPop) {
      currentNavigator?.pop();
    } else {
      navBloc.add(const NavEvent.changePageIndex(PageIndex.posts));
    }
    if (navBloc.state.pageIndex == PageIndex.posts && !canPop) {
      bool exitConfirmed = false;
      await ConfirmDialog.show(
        context,
        confirmMessage: "Leave app",
        onConfirm: () => exitConfirmed = true,
      );
      if (context.mounted && exitConfirmed) {
        currentNavigator?.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (
        bool didPop,
      ) =>
          onPopInvokedWithResult(context, didPop),
      child: Scaffold(
        body: PageTransitionSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (
              Widget child,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                FadeThroughTransition(
                  secondaryAnimation: secondaryAnimation,
                  animation: animation,
                  child: child,
                ),
            child: body(context)),
        bottomNavigationBar: const NavBarWidget(),
      ),
    );
  }

  Widget body(
    BuildContext context,
  ) =>
      BlocBuilder<NavBloc, NavState>(
        builder: (context, state) {
          return IndexedStack(
            index: state.pageIndex.index, // Controls which Navigator is visible
            children: state.navigatorKeys.entries
                .map((entry) => Navigator(
                      key: entry.value,
                      onGenerateRoute: (routeSettings) {
                        return MaterialPageRoute(
                          settings: routeSettings,
                          builder: (context) {
                            // Use the entry key to determine the corresponding page
                            int pageIndex = state.navigatorKeys.keys
                                .toList()
                                .indexOf(entry.key);
                            return screens[pageIndex];
                          },
                        );
                      },
                    ))
                .toList(),
          );
        },
      );
}

List<Widget> screens = [PostPage(), Profile()];

extension PageIndexExt on PageIndex {
  Widget get selectedPage {
    switch (this) {
      case PageIndex.posts:
        return const PostPage();

      case PageIndex.profile:
        return const Profile();
    }
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push<void>(
              MaterialPageRoute(builder: (context) => const Profile2()));
        },
        child: const Text("Profile"),
      ),
    );
  }
}

class Profile2 extends StatelessWidget {
  const Profile2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Profile"),
      ),
    );
  }
}
