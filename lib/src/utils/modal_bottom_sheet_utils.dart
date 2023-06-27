import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/bottom_sheet/wallets_bottom_sheet.dart' as wallet;
import 'package:flutter/material.dart';

class ModalBottomSheetUtils {
  static Widget getBottomSheetFromEndDrawerItemType(BuildContext context, EndDrawerItemType? type) {
    switch (type) {
      case EndDrawerItemType.wallets:
        return const wallet.WalletsBottomSheet();
      default:
        throw Exception('Type = $type is not mapped');
    }
  }

  static Future<void> showAppModalBottomSheet(BuildContext context, EndDrawerItemType type) async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => getBottomSheetFromEndDrawerItemType(context, type),
    );
  }
}
