import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:flutter/material.dart';

class TokenTile extends StatelessWidget {
  const TokenTile({
    required this.token,
    required this.ticker,
    super.key,
  });

  final Token token;
  final Ticker? ticker;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColors.secondary,
      ),
      title: Text(
        token.name,
      ),
      subtitle: Text(
        '${ticker?.price ?? ''}',
      ),
    );
  }
}
