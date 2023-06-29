import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/bottom_sheet_title.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/common_bottom_sheet_buttons.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/modal_sheet_divider.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/modal_sheet_separator.dart';
import 'package:flutter/material.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({
    required this.child,
    super.key,
    this.showOkButton = true,
    this.showCancelButton = true,
    this.showDivider = false,
    this.title,
    this.onOk,
    this.onCancel,
    this.textStyle,
    this.decoration,
  });

  final Widget child;
  final String? title;
  final void Function()? onOk;
  final void Function()? onCancel;
  final bool showOkButton;
  final bool showCancelButton;
  final bool showDivider;
  final TextStyle? textStyle;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ModalSheetSeparator(),
            if (title != null)
              BottomSheetTitle(
                title: title!,
                textStyle: textStyle,
              ),
            child,
            if (showDivider) const ModalSheetDivider(),
            if (showOkButton || showCancelButton)
              CommonBottomSheetButtons(
                showOkButton: showOkButton,
                showCancelButton: showCancelButton,
                onOk: onOk,
                onCancel: onCancel,
              ),
          ],
        ),
      ),
    );
  }
}
