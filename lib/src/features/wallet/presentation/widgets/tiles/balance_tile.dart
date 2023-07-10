import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
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
  final ChainType chain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Padding(
        padding: Styles.edgeInsetVertical10,
        child: Text.rich(
          TextSpan(
            style: textTheme.headlineSmall!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.w500,
            ),
            children: <TextSpan>[
              const TextSpan(
                text: r'$',
              ),
              TextSpan(
                text: ' ${nativeBalance.toStringAsFixed(2)}',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
