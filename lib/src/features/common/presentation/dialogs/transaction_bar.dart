import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class TransactionBar extends StatelessWidget {
  const TransactionBar({
    super.key,
    this.completed = false,
    this.onTap,
  });

  final bool completed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    if (completed) {
      return GestureDetector(
        onTap: onTap,
        child: _Toast(
          title: s.txCompleted,
          subtitle: s.tapToViewTx,
          leading: const Icon(
            Icons.check,
            color: AppColors.success,
          ),
        ),
      );
    }

    return _Toast(
      title: s.txSubmitted,
      subtitle: s.txWaiting,
      leading: const CircularProgressIndicator(
        strokeWidth: 3,
        color: Colors.blue,
        backgroundColor: AppColors.variantBlack,
      ),
    );
  }
}

class _Toast extends StatelessWidget {
  const _Toast({
    required this.title,
    required this.subtitle,
    required this.leading,
  });

  final String title;
  final String subtitle;
  final Widget leading;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.bodySmall!.copyWith(
      fontSize: 11,
      color: Colors.white,
    );
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: 2),
        leading: leading,
        title: Text(
          title,
          style: style.copyWith(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: style,
        ),
      ),
    );
  }
}
