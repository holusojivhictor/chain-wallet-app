import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tab/custom_tab_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:flutter/material.dart';

class PersistedTopView extends SliverPersistentHeaderDelegate {
  PersistedTopView({
    required this.wallet,
    required this.chain,
    required this.elevation,
    required this.forceElevated,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.tabController,
  });

  final Wallet wallet;
  final EthereumChain chain;
  final double? elevation;
  final bool forceElevated;
  final double? expandedHeight;
  final double collapsedHeight;
  final TabController tabController;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return _TopView(
      maxHeight: maxExtent,
      wallet: wallet,
      chain: chain,
      tabController: tabController,
    );
  }

  @override
  double get maxExtent => expandedHeight ?? 300;

  @override
  double get minExtent => collapsedHeight;

  @override
  bool shouldRebuild(covariant PersistedTopView oldDelegate) {
    return chain != oldDelegate.chain ||
        wallet != oldDelegate.wallet ||
        elevation != oldDelegate.elevation ||
        forceElevated != oldDelegate.forceElevated ||
        expandedHeight != oldDelegate.expandedHeight;
  }
}

class _TopView extends StatelessWidget implements PreferredSizeWidget {
  const _TopView({
    required this.maxHeight,
    required this.wallet,
    required this.chain,
    required this.tabController,
  });

  final Wallet wallet;
  final EthereumChain chain;
  final double maxHeight;
  final TabController tabController;

  @override
  Size get preferredSize => Size.fromHeight(maxHeight);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AddressTile(address: wallet.shortAddress),
              BalanceTile(
                balance: wallet.walletBalance,
                nativeBalance: wallet.native,
                chain: chain,
              ),
            ],
          ),
          CustomTabBar(
            tabController: tabController,
          ),
        ],
      ),
    );
  }
}
