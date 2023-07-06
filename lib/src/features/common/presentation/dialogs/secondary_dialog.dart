import 'package:chain_wallet_mobile/src/extensions/media_query_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SecondaryDialog extends StatelessWidget {
  const SecondaryDialog({
    required this.titleText,
    required this.contentText,
    super.key,
    this.actionText,
    this.cancelText,
    this.actionOnPressed,
    this.cancelOnPressed,
  });

  final String titleText;
  final String contentText;
  final String? actionText;
  final String? cancelText;
  final void Function()? actionOnPressed;
  final void Function()? cancelOnPressed;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final s = S.of(context);
    return AlertDialog(
      elevation: 10,
      alignment: Alignment.center,
      shape: Styles.alertDialogShape,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: AppColors.tertiary,
      title: Text(
        titleText,
        textAlign: TextAlign.center,
        style: theme.textTheme.headlineSmall!.copyWith(
          color: AppColors.error,
          fontSize: 22,
        ),
      ),
      content: SizedBox(
        width: mediaQuery.widthForDialog,
        height: mediaQuery.heightForDialog(2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              contentText,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: AppColors.grey6,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PrimaryButton(
                  borderRadius: 8,
                  padding: const EdgeInsets.only(top: 5),
                  contentPadding: EdgeInsets.zero,
                  text: cancelText ?? s.close,
                  onPressed: cancelOnPressed != null
                      ? () => cancelOnPressed!()
                      : () => Navigator.of(context).pop(),
                ),
                PrimaryButton(
                  isPrimary: false,
                  text: actionText ?? s.okay,
                  textColor: AppColors.error,
                  borderRadius: 8,
                  padding: const EdgeInsets.only(top: 5),
                  contentPadding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  onPressed: actionOnPressed != null
                      ? () => actionOnPressed!()
                      : () => Navigator.of(context).pop(),
                  side: Styles.alertButtonBorderSide,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
