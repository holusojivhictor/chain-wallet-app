import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tab/custom_tab_bar.dart';
import 'package:flutter/material.dart';

class TokensMainView extends StatefulWidget {
  const TokensMainView({super.key});

  @override
  State<TokensMainView> createState() => _TokensMainViewState();
}

class _TokensMainViewState extends State<TokensMainView>
    with SingleTickerProviderStateMixin {
  late final TabController tabController;

  static const int tabLength = 2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabLength, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTabBar(
          tabController: tabController,
        ),
        SizedBox(
          height: 300,
          width: double.infinity,
          child: TabBarView(
            controller: tabController,
            children: [
              Placeholder(),
              Placeholder(),
            ],
          ),
        ),
      ],
    );
  }
}
