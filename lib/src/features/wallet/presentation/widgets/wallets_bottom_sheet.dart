import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/common_bottom_sheet.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class WalletsBottomSheet extends StatelessWidget {
  const WalletsBottomSheet({super.key});

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