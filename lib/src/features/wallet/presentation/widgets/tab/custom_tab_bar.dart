import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      tabs: const [
        Tab(text: 'TOKENS'),
        Tab(text: 'NFTs'),
      ],
    );
  }
}
