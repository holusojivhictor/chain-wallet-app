import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/common_button_bar.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class CommonBottomSheetButtons extends StatelessWidget {
  const CommonBottomSheetButtons({
    super.key,
    this.showOkButton = true,
    this.showCancelButton = true,
    this.onOk,
    this.onCancel,
    this.cancelText,
    this.okText,
  });

  final bool showOkButton;
  final bool showCancelButton;
  final void Function()? onOk;
  final void Function()? onCancel;
  final String? cancelText;
  final String? okText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    final cancel = cancelText ?? s.cancel;
    final ok = okText ?? s.ok;

    return CommonButtonBar(
      children: <Widget>[
        if (showCancelButton)
          OutlinedButton(
            onPressed: () => onCancel != null ? onCancel!() : Navigator.pop(context),
            child: Text(cancel, style: TextStyle(color: theme.primaryColor)),
          ),
        if (showOkButton)
          ElevatedButton(
            onPressed: onOk != null ? () => onOk!() : null,
            child: Text(ok),
          ),
      ],
    );
  }
}
