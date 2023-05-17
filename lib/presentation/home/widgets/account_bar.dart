import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/presentation/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_bar_tile.dart';

class AccountBar extends StatelessWidget {
  const AccountBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletsBloc, WalletsState>(
      builder: (ctx, state) => state.map(
        loading: (_) => const Loading(useScaffold: false),
        loaded: (state) {
          final wallet = state.wallets.first;
          return AccountBarTile(
            accountName: wallet.accountName,
            type: wallet.type,
            avatarUrl: wallet.avatar,
          );
        },
      ),
    );
  }
}
