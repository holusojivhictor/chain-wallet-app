import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    required this.hint,
    super.key,
  });

  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.grey5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hint),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }
}
