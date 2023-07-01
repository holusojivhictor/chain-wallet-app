import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/avatars/avatars.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/text/short_address.dart';
import 'package:flutter/material.dart';

class WalletTile extends StatelessWidget {
  const WalletTile({
    required this.wallet,
    required this.onTap,
    required this.selected,
    super.key,
  });

  final Wallet wallet;
  final VoidCallback onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final child = ListTile(
      visualDensity: VisualDensity.compact,
      leading: WalletAvatar(avatarUrl: wallet.avatar),
      title: Text(
        wallet.name,
        style: theme.textTheme.titleMedium,
      ),
      selected: selected,
      subtitle: ShortAddress(
        address: wallet.address,
        style: theme.textTheme.bodySmall,
      ),
      selectedTileColor: theme.colorScheme.primary.withOpacity(0.07),
      onTap: onTap.call,
    );

    if (selected) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(width: 3, color: theme.colorScheme.primary),
          ),
        ),
        child: child,
      );
    }

    return child;
  }
}
