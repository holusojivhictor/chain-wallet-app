import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'mobile_scaffold.dart';
import 'shared/utils/toast_utils.dart';

class MainTabPage extends StatefulWidget {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  State<MainTabPage> createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> with SingleTickerProviderStateMixin {
  bool _didChangeDependencies = false;
  late TabController _tabController;
  final _defaultIndex = 0;
  DateTime? backButtonPressTime;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: _defaultIndex,
      length: 3,
      vsync: this,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didChangeDependencies) return;
    _didChangeDependencies = true;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: handleWillPop,
      child: MobileScaffold(defaultIndex: _defaultIndex, tabController: _tabController),
    );
  }

  void _goToTab(int newIndex) => context.read<MainTabBloc>().add(MainTabEvent.goToTab(index: newIndex));

  Future<bool> handleWillPop() async {
    final s = S.of(context);
    if (_tabController.index != _defaultIndex) {
      _goToTab(_defaultIndex);
      return false;
    }

    final settings = context.read<SettingsBloc>();
    if (!settings.doubleBackToClose) {
      return true;
    }

    final now = DateTime.now();
    final mustWait = backButtonPressTime == null || now.difference(backButtonPressTime!) > ToastUtils.toastDuration;

    if (mustWait) {
      backButtonPressTime = now;
      final fToast = ToastUtils.of(context);
      ToastUtils.showInfoToast(fToast, s.pressToExit);
      return false;
    }

    return true;
  }
}
