import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:myproject/core/widgets/dialogs/confirm_dialog.dart';
import 'package:myproject/features/base_page/view/widgets/nav_bar.dart';

class BasePage extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BasePage({
    required this.navigationShell,
    super.key,
  });

  void _onPopInvokedWithResult(
    BuildContext context,
    bool didPop,
  ) async {
    bool canPop = context.canPop();
    if (navigationShell.currentIndex == 0 && !canPop) {
      bool exitConfirmed = false;
      await ConfirmDialog.show(
        context,
        confirmMessage: "Leave app",
        onConfirm: () => exitConfirmed = true,
      );
      if (context.mounted && exitConfirmed) {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    } else {
      navigationShell.goBranch(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (
        bool didPop,
      ) =>
          _onPopInvokedWithResult(context, didPop),
      child: Scaffold(
        body: navigationShell,
        bottomNavigationBar: NavBarWidget(
          navigationShell: navigationShell,
        ),
      ),
    );
  }
}
