import 'package:chain_wallet_mobile/src/features/common/presentation/loading.dart';
import 'package:chain_wallet_mobile/src/features/home/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/home/presentation/widgets/account_bar_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountBar extends StatelessWidget {
  const AccountBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsBloc, WalletsState>(
      builder: (ctx, state) {
        final wallet = state.wallets.first;
        return AccountBarTile(
          accountName: wallet.accountName,
          type: wallet.type,
          avatarUrl: wallet.avatar,
        );
      },
    );
  }
}
