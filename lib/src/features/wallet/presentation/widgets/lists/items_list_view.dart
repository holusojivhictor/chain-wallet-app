import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:flutter/material.dart';

class ItemsListView<T extends Wallet> extends StatelessWidget {
  const ItemsListView({
    required this.selectedItem,
    required this.items,
    required this.onTap,
    super.key,
  });

  final T selectedItem;
  final List<T> items;
  final void Function(T) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ...items.map((T e) {
          return WalletTile(
            key: ValueKey<int>(e.key),
            wallet: e,
            onTap: () => onTap(e),
            selected: selectedItem == e,
          );
        }),
      ],
    );
  }
}
