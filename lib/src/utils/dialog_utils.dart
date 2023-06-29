import 'package:chain_wallet_mobile/src/features/common/presentation/dialogs/dialogs.dart';
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
    return _baseDialog(
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
    return _baseDialog(
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

  static void _baseDialog(
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
      case DialogType.secondary:
        child = SecondaryDialog(
          titleText: titleText,
          contentText: contentText,
          actionText: actionText,
          cancelText: cancelText,
          actionOnPressed: actionOnPressed,
          cancelOnPressed: cancelOnPressed,
        );
    }

    showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (ctx) => child,
    );
  }
}
