import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/styles.dart';
import 'package:flutter/material.dart';

class PhraseChip extends StatelessWidget {
  final int position;
  final String value;

  const PhraseChip({
    Key? key,
    required this.position,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: Styles.chipBorderRadius,
      ),
      child: Center(
        child: Text.rich(
          TextSpan(
            text: '$position. ',
            style: textTheme.bodyLarge!.copyWith(color: AppColors.grey4),
            children: <TextSpan>[
              TextSpan(
                text: value,
                style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600, color: AppColors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
