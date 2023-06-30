import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/app_bar/account_bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBar extends StatelessWidget {
  const AccountBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (previous, current) {
        return previous.activeWallet.key != current.activeWallet.key;
      },
      builder: (ctx, state) {
        final wallet = state.activeWallet;
        return AccountBarTile(
          accountName: wallet.name,
          type: wallet.type,
          avatarUrl: wallet.avatar,
        );
      },
    );
  }
}
