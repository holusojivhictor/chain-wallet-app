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
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: CircleAvatar(
        radius: 18,
        backgroundColor: AppColors.grey4,
        child: Text(
          token.avatar,
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
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
