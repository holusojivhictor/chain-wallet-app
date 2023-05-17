import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/home/home_page.dart';
import 'package:chain_wallet_mobile/presentation/shared/extensions/focus_scope_node_extensions.dart';
import 'package:chain_wallet_mobile/presentation/shared/navigation_bar/animated_navigation_bar.dart';
import 'package:chain_wallet_mobile/presentation/shared/navigation_bar/navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MobileScaffold extends StatefulWidget {
  final int defaultIndex;
  final TabController tabController;

  const MobileScaffold({
    Key? key,
    required this.defaultIndex,
    required this.tabController,
  }) : super(key: key);

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.defaultIndex;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      body: BlocListener<MainTabBloc, MainTabState>(
        listener: (ctx, state) async {
          state.maybeMap(
            initial: (s) => _changeCurrentTab(s.currentSelectedTab),
            orElse: () => {},
          );
        },
        child: TabBarView(
          controller: widget.tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            const HomePage(),
            Container(color: Colors.blue),
            Container(color: Colors.indigo),
          ],
        ),
      ),
      bottomNavigationBar: AnimatedNavigationBar(
        elevation: 0,
        currentIndex: _index,
        selectedItemColor: AppColors.variantBlack,
        unselectedItemColor: AppColors.variantGrey4,
        backgroundColor: AppColors.secondary.withOpacity(0.6),
        onItemSelected: _goToTab,
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
    );
  }

  void _changeCurrentTab(int index) {
    FocusScope.of(context).removeFocus();
    widget.tabController.index = index;
    setState(() {
      _index = index;
    });
  }

  void _goToTab(int newIndex) => context.read<MainTabBloc>().add(MainTabEvent.goToTab(index: newIndex));
}

