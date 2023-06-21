import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class ModalSheetDivider extends StatelessWidget {
  const ModalSheetDivider({
    this.height = 2,
    this.thickness = 2,
    this.color = AppColors.grey2,
    super.key,
  });

  final double height;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: height,
      thickness: thickness,
      color: color,
    );
  }
}
