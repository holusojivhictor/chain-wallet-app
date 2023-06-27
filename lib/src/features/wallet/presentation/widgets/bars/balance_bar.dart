import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:flutter/material.dart';

class BalanceBar extends StatelessWidget {
  const BalanceBar({
    required this.balance,
    required this.chain,
    super.key,
  });

  final double balance;
  final EthereumChain chain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              style: textTheme.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: '$balance',
                ),
                TextSpan(
                  text: ' ${chain.currency}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
