import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/lists/items_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletsListBar extends StatelessWidget {
  const WalletsListBar({
    required this.onWalletTapped,
    super.key,
  });

  final ValueChanged<Wallet> onWalletTapped;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      listenWhen: (prev, current) {
        return false;
      },
      listener: (ctx, state) {},
      buildWhen: (prev, current) {
        return prev.wallets.length != current.wallets.length;
      },
      builder: (ctx, state) {
        return ItemsListView<Wallet>(
          selectedItem: state.activeWallet,
          items: state.wallets,
          onTap: onWalletTapped,
        );
      },
    );
  }
}
