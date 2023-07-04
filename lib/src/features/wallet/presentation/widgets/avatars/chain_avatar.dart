import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:flutter/material.dart';

class ChainAvatar extends StatelessWidget {
  const ChainAvatar({required this.chain, super.key});

  final ChainType chain;

  @override
  Widget build(BuildContext context) {
    const avatarStyle = TextStyle(
      fontSize: 12,
      color: Colors.white70,
      fontWeight: FontWeight.w500,
    );

    return CircleAvatar(
      radius: 10,
      backgroundColor: chain.bgColor,
      child: Text(
        chain.avatar,
        style: avatarStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
