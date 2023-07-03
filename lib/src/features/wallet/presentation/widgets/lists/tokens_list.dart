import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:flutter/material.dart';

class TokensList extends StatelessWidget {
  const TokensList({
    required this.tokens,
    required this.tickerById,
    super.key,
  });

  final List<Token> tokens;
  final Map<String, Ticker> tickerById;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...tokens.map((e) {
          return TokenTile(
            token: e,
            ticker: tickerById[e.productId],
          );
        }),
      ],
    );
  }
}
