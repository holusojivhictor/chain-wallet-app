import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:flutter/material.dart';

class BalanceTile extends StatelessWidget {
  const BalanceTile({
    required this.balance,
    required this.nativeBalance,
    required this.chain,
    super.key,
  });

  final double balance;
  final double nativeBalance;
  final EthereumChain chain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Column(
        children: <Widget>[
          Text.rich(
            TextSpan(
              style: textTheme.headlineSmall,
              children: <TextSpan>[
                TextSpan(
                  text: balance.fixed(5),
                ),
                TextSpan(
                  text: ' ${chain.currency}',
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text.rich(
            TextSpan(
              style: textTheme.bodyMedium,
              children: <TextSpan>[
                const TextSpan(
                  text: r'$',
                ),
                TextSpan(
                  text: nativeBalance.toStringAsFixed(2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
