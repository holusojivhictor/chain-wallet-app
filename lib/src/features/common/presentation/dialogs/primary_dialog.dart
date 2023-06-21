import 'package:chain_wallet_mobile/src/extensions/media_query_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class PrimaryDialog extends StatelessWidget {
  const PrimaryDialog({
    required this.titleText,
    required this.contentText,
    super.key,
    this.actionText,
    this.actionOnPressed,
  });

  final String titleText;
  final String contentText;
  final String? actionText;
  final void Function()? actionOnPressed;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    final s = S.of(context);
    return AlertDialog(
      elevation: 10,
      alignment: Alignment.center,
      shape: Styles.alertDialogShape,
      surfaceTintColor: AppColors.tertiary,
      title: SizedBox(
        child: Text(
          titleText,
          style: theme.textTheme.headlineSmall!.copyWith(
            color: const Color(0xFF231F20),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      content: SizedBox(
        width: mediaQuery.getWidthForDialogs(),
        height: mediaQuery.getHeightForDialogs(1) + 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                contentText,
                style: theme.textTheme.bodyMedium!
                    .copyWith(color: AppColors.grey7),
              ),
            ),
            PrimaryButton(
              borderRadius: 8,
              isPrimary: false,
              padding: const EdgeInsets.only(top: 5),
              contentPadding: Styles.edgeInsetAll10,
              text: actionText ?? s.okay,
              onPressed: actionOnPressed != null
                  ? () => actionOnPressed!()
                  : () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
