import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/bottom_sheet/wallets_bottom_sheet.dart'
    as wallet;
import 'package:flutter/material.dart';

class ModalBottomSheetUtils {
  static Widget getBottomSheetFromEndDrawerItemType(
    BuildContext context,
    EndDrawerItemType? type,
  ) {
    if (type != null) {
      switch (type) {
        case EndDrawerItemType.wallets:
          return const wallet.WalletsBottomSheet();
      }
    }
    return Container();
  }

  static Future<void> showAppModalBottomSheet(
    BuildContext context,
    EndDrawerItemType type, {
    AnimationController? controller,
  }) async {
    await showModalBottomSheet<void>(
      context: context,
      elevation: 0,
      useRootNavigator: true,
      isScrollControlled: true,
      transitionAnimationController: controller,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (ctx) => getBottomSheetFromEndDrawerItemType(context, type),
    );
  }
}
