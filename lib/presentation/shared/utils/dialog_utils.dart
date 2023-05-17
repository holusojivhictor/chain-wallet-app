import 'package:chain_wallet_mobile/presentation/shared/dialogs/primary_dialog.dart';
import 'package:chain_wallet_mobile/presentation/shared/dialogs/secondary_dialog.dart';
import 'package:flutter/material.dart';

enum DialogType {
  primary,
  secondary,
}

class DialogUtils {
  static void showPrimaryDialog(
    BuildContext context,
    String titleText,
    String contentText, {
    String? actionText,
    void Function()? actionOnPressed,
  }) {
    return baseDialog(
      context,
      titleText,
      contentText,
      DialogType.primary,
      actionText: actionText,
      actionOnPressed: actionOnPressed,
    );
  }

  static void showSecondaryDialog(
    BuildContext context,
    String titleText,
    String contentText, {
    String? actionText,
    String? cancelText,
    void Function()? actionOnPressed,
    void Function()? cancelOnPressed,
  }) {
    return baseDialog(
      context,
      titleText,
      contentText,
      DialogType.secondary,
      actionText: actionText,
      cancelText: cancelText,
      actionOnPressed: actionOnPressed,
      cancelOnPressed: cancelOnPressed,
    );
  }

  static void baseDialog(
    BuildContext context,
    String titleText,
    String contentText,
    DialogType type, {
    String? actionText,
    String? cancelText,
    void Function()? actionOnPressed,
    void Function()? cancelOnPressed,
    bool barrierDismissible = false,
  }) {
    Widget child;
    switch (type) {
      case DialogType.primary:
        child = PrimaryDialog(
          titleText: titleText,
          contentText: contentText,
          actionText: actionText,
          actionOnPressed: actionOnPressed,
        );
        break;
      case DialogType.secondary:
        child = SecondaryDialog(
          titleText: titleText,
          contentText: contentText,
          actionText: actionText,
          cancelText: cancelText,
          actionOnPressed: actionOnPressed,
          cancelOnPressed: cancelOnPressed,
        );
        break;
      default:
        throw Exception('Invalid dialog type = $type');
    }

    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => child,
    );
  }
}
