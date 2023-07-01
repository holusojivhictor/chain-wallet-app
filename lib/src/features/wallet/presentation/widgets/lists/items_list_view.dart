import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ItemsListView<T extends Wallet> extends StatelessWidget {
  const ItemsListView({
    required this.items,
    required this.selectedItem,
    required this.itemScrollController,
    required this.onTap,
    super.key,
  });

  final List<T> items;
  final T selectedItem;
  final ItemScrollController itemScrollController;
  final void Function(T) onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ScrollablePositionedList.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        itemScrollController: itemScrollController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final e = items.elementAt(index);

          return WalletTile(
            key: ValueKey<int>(e.key),
            wallet: e,
            onTap: () => onTap(e),
            selected: selectedItem == e,
          );
        },
      ),
    );
  }
}
