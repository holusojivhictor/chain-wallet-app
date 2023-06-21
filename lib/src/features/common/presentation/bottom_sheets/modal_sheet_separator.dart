import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class ModalSheetSeparator extends StatelessWidget {
  const ModalSheetSeparator({super.key, this.hasMargin = true});

  final bool hasMargin;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 5, top: hasMargin ? 5 : 2),
        child: SizedBox(
          width: 65,
          height: 5,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
