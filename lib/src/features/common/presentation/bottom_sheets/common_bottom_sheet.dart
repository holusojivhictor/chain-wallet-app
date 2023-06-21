import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/bottom_sheet_title.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/common_bottom_sheet_buttons.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/modal_sheet_divider.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/modal_sheet_separator.dart';
import 'package:flutter/material.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({
    required this.title,
    required this.child,
    super.key,
    this.showTitle = true,
    this.showOkButton = true,
    this.showCancelButton = true,
    this.showDivider = false,
    this.onOk,
    this.onCancel,
    this.textStyle,
    this.decoration,
  });

  final String title;
  final Widget child;
  final void Function()? onOk;
  final void Function()? onCancel;
  final bool showTitle;
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
        margin: const EdgeInsets.all(3),
        decoration: decoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const ModalSheetSeparator(),
            if (showTitle)
              BottomSheetTitle(
                title: title,
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
