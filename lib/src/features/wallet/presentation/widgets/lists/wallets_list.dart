import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/lists/items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class WalletsListBar extends StatelessWidget {
  const WalletsListBar({
    required this.onWalletTapped,
    required this.itemScrollController,
    super.key,
  });

  final ValueChanged<Wallet> onWalletTapped;
  final ItemScrollController itemScrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      listenWhen: (prev, current) {
        return false;
      },
      listener: (ctx, state) {},
      buildWhen: buildWhen,
      builder: (ctx, state) {
        return ItemsListView<Wallet>(
          items: state.wallets,
          chain: state.currentChain,
          selectedItem: state.activeWallet,
          itemScrollController: itemScrollController,
          onTap: onWalletTapped,
        );
      },
    );
  }

  bool buildWhen(WalletState previous, WalletState current) {
    return previous.wallets.length != current.wallets.length ||
        previous.activeWallet.key != current.activeWallet.key ||
        previous.currentChain != current.currentChain ||
        previous.balanceStatus != current.balanceStatus;
  }
}
