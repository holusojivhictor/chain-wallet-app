import 'package:chain_wallet_mobile/src/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/navigation_bar/navigation_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/theme.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({required this.shell, super.key});

  final StatefulNavigationShell shell;

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  DateTime? backButtonPressTime;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context).extension<AppThemeExtension>()!;
    return WillPopScope(
      onWillPop: handleWillPop,
      child: Scaffold(
        body: widget.shell,
        bottomNavigationBar: AnimatedNavigationBar(
          elevation: 15,
          iconSize: 22,
          shape: Styles.navBorder,
          currentIndex: widget.shell.currentIndex,
          selectedItemColor: theme.navSelectedColor,
          unselectedItemColor: theme.navUnselectedColor,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          onItemSelected: _goBranch,
          items: [
            NavigationBarItem(
              icon: const Icon(Icons.wallet_outlined),
              activeIcon: const Icon(Icons.wallet),
              title: s.home,
            ),
            NavigationBarItem(
              icon: const Icon(Icons.inventory_outlined),
              activeIcon: const Icon(Icons.inventory_rounded),
              title: s.history,
            ),
            NavigationBarItem(
              icon: const Icon(Icons.settings_outlined),
              activeIcon: const Icon(Icons.settings),
              title: s.settings,
            ),
          ],
        ),
      ),
    );
  }

  void _goBranch(int index) {
    widget.shell.goBranch(
      index,
      initialLocation: index == widget.shell.currentIndex,
    );
  }

  Future<bool> handleWillPop() async {
    if (widget.shell.currentIndex != 0) {
      _goBranch(0);
      return false;
    }

    final settings = context.read<SettingsBloc>();
    if (!settings.doubleBackToClose) {
      return true;
    }

    final now = DateTime.now();
    final mustWait = backButtonPressTime == null ||
        now.difference(backButtonPressTime!) > ToastUtils.toastDuration;

    if (mustWait) {
      backButtonPressTime = now;
      final fToast = ToastUtils.of(context);
      ToastUtils.showInfoToast(fToast, 'Press once again to exit'.hardcoded);
      return false;
    }

    return true;
  }
}
