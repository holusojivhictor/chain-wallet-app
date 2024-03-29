import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class PreferenceSwitchTile extends StatelessWidget {
  const PreferenceSwitchTile({
    required this.title,
    required this.value,
    super.key,
    this.leadingIcon,
    this.onChanged,
  });

  final bool value;
  final String title;
  final Widget? leadingIcon;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        leading: leadingIcon,
        visualDensity: const VisualDensity(vertical: 2),
        contentPadding: const EdgeInsets.only(left: 12),
        trailing: Switch.adaptive(
          activeColor: AppColors.primary,
          value: value,
          onChanged: onChanged != null ? (value) => onChanged!(value) : null,
        ),
      ),
    );
  }
}
