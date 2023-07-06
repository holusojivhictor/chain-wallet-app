import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/avatars/avatars.dart';
import 'package:flutter/material.dart';

class WalletTile extends StatelessWidget {
  const WalletTile({
    required this.wallet,
    required this.onTap,
    required this.chain,
    required this.selected,
    super.key,
  });

  final Wallet wallet;
  final VoidCallback onTap;
  final ChainType chain;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trailingStyle = theme.textTheme.bodyMedium!.copyWith(
      fontSize: 13,
    );

    final child = ListTile(
      visualDensity: VisualDensity.compact,
      leading: WalletAvatar(avatarUrl: wallet.avatar),
      title: Text(
        wallet.name,
        style: theme.textTheme.titleMedium,
      ),
      selected: selected,
      subtitle: Text(
        wallet.address.short,
        style: theme.textTheme.bodySmall,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text.rich(
            TextSpan(
              style: trailingStyle,
              children: [
                const TextSpan(
                  text: r'$',
                ),
                TextSpan(
                  text: wallet.native.toStringAsFixed(2),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3),
          Text.rich(
            TextSpan(
              style: trailingStyle,
              children: <TextSpan>[
                TextSpan(
                  text: wallet.walletBalance.fixed(5),
                ),
                TextSpan(text: ' ${chain.currency}'),
              ],
            ),
          ),
        ],
      ),
      onTap: onTap.call,
    );

    if (selected) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 3, color: theme.colorScheme.primary),
          ),
          color: selected ? theme.colorScheme.primary.withOpacity(0.07) : null,
        ),
        child: child,
      );
    }

    return child;
  }
}
