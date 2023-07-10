import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BalanceRow extends StatelessWidget {
  const BalanceRow({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (_, __) => false,
      builder: (_, state) {
        final wallet = state.activeWallet;
        final currency = state.currentChain.currency;
        return Padding(
          padding: Styles.edgeInsetAll7,
          child: Center(
            child: Text(
              '${s.balance}: ${wallet.walletBalance.fixed(5)} $currency',
            ),
          ),
        );
      },
    );
  }
}
