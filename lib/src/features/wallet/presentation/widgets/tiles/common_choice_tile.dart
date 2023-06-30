import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/avatars/avatars.dart';
import 'package:flutter/material.dart';

class CommonChoiceTile<T> extends StatelessWidget {
  const CommonChoiceTile({
    required this.value,
    required this.valueText,
    required this.onPressed,
    required this.isSelected,
    super.key,
    this.textStyle,
  });

  final T value;
  final String valueText;
  final TextStyle? textStyle;
  final void Function(T value)? onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      visualDensity: const VisualDensity(vertical: 2, horizontal: 2),
      leading: value is EthereumChain
          ? Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ChainAvatar(chain: value as EthereumChain),
            )
          : null,
      title: Text(
        valueText,
        style: textStyle ?? textTheme.titleMedium!.copyWith(fontSize: 15),
      ),
      trailing: isSelected ? const Icon(Icons.check) : null,
      shape: const Border(
        top: BorderSide(
          width: .7,
          color: AppColors.grey3,
        ),
      ),
      onTap: onPressed != null ? () => onPressed!(value) : null,
    );
  }
}
