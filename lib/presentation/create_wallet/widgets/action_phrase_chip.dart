import 'package:chain_wallet_mobile/domain/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/styles.dart';
import 'package:flutter/material.dart';

class ActionPhraseChip<T> extends StatelessWidget {
  final T value;
  final int position;
  final String valueText;
  final void Function(T value)? onPressed;
  final bool isSelected;
  final bool hasIndex;

  const ActionPhraseChip({
    Key? key,
    required this.value,
    required this.position,
    required this.valueText,
    required this.onPressed,
    required this.isSelected,
    required this.hasIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ActionChip(
      label: hasIndex
          ? IndexedText(position: position, valueText: valueText)
          : Text(
              valueText,
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColors.grey4.withOpacity(0.3) : AppColors.white,
              ),
            ),
      side: hasIndex
          ? isSelected ? const BorderSide(color: Colors.white, width: 2)
          : BorderSide.none : BorderSide.none,
      padding: Styles.edgeInsetHorizontal5,
      onPressed: onPressed != null ? () => onPressed!(value) : null,
      backgroundColor: AppColors.primary,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      shape: Styles.chipShape,
    );
  }
}

class IndexedText extends StatelessWidget {
  final int position;
  final String valueText;
  const IndexedText({
    Key? key,
    required this.position,
    required this.valueText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Text.rich(
      TextSpan(
        text: '$position. ',
        style: textTheme.bodyLarge!.copyWith(color: AppColors.grey4),
        children: <TextSpan>[
          TextSpan(
            text: valueText.isNotNullEmptyOrWhitespace ? valueText : '      ',
            style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
