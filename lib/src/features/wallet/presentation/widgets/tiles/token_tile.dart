import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:flutter/material.dart';

class TokenTile extends StatelessWidget {
  const TokenTile({
    required this.token,
    required this.ticker,
    required this.chain,
    super.key,
  });

  final Token token;
  final Ticker? ticker;
  final ChainType chain;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final changeStyle = textTheme.bodyMedium!.copyWith(
      color: ticker?.change?.isNegative ?? false
          ? AppColors.error
          : AppColors.success,
    );

    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.grey4,
        child: Text(
          token.avatar,
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      title: Text(
        token.name,
      ),
      subtitle: Row(
        children: [
          Text(r'$' '${ticker?.price ?? 0}'),
          const SizedBox(width: 5),
          Text(
            ticker != null ? '${ticker?.change?.fixed(2)}%' : '0%',
            style: changeStyle,
          ),
        ],
      ),
      trailing: Text(
        '${token.balance?.fixed(3)} ${chain.currency}',
        style: textTheme.bodyMedium,
      ),
    );
  }
}
