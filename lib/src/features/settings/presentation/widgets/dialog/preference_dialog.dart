import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/popup/popup.dart';
import 'package:flutter/material.dart';

class PreferenceDialog<T> extends StatelessWidget {
  const PreferenceDialog({
    required this.title,
    required this.items,
    super.key,
    this.elevation,
  });

  final String title;
  final List<PopupEntry<T>> items;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return AlertDialog(
      elevation: elevation,
      alignment: Alignment.center,
      shape: Styles.alertDialogShape,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: AppColors.tertiary,
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, textAlign: TextAlign.center),
        shape: const Border(bottom: BorderSide(color: AppColors.grey5)),
      ),
      content: SizedBox(
        width: mediaQuery.size.width / 1.3,
        height: mediaQuery.heightForDialog(items.length + 1, itemHeight: 35),
        child: Column(
          children: [
            ...items,
          ],
        ),
      ),
    );
  }
}
