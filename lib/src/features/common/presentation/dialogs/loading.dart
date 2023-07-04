import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        width: 100,
        padding: Styles.edgeInsetAll16,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: Styles.defaultBorderRadius,
        ),
        child: const Padding(
          padding: Styles.edgeInsetAll10,
          child: CircularProgressIndicator(
            strokeWidth: 3,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
