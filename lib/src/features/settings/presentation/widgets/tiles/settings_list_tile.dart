import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

class SettingsListTile extends StatelessWidget {
  const SettingsListTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
    super.key,
  });

  final String title;
  final String subtitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: Styles.edgeInsetHorizontal16,
      child: ListTile(
        isThreeLine: subtitle.isNotEmpty,
        visualDensity: const VisualDensity(vertical: 2),
        contentPadding: EdgeInsets.zero,
        shape: const Border(bottom: BorderSide(color: AppColors.grey4)),
        title: Text(
          title,
          style: textTheme.titleMedium!.copyWith(
            fontSize: 19,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodySmall!.copyWith(
            fontSize: 13,
          ),
        ),
        trailing: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.grey6,
              size: 20,
            ),
          ],
        ),
        onTap: () => onTap!(),
      ),
    );
  }
}
