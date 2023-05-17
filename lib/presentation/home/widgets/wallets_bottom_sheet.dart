import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/shared/bottom_sheets/common_bottom_sheet.dart';
import 'package:flutter/material.dart';

class WalletsBottomSheet extends StatelessWidget {
  const WalletsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CommonBottomSheet(
      title: s.accounts,
      showOkButton: false,
      showCancelButton: false,
      child: Container(),
    );
  }
}
