import 'package:chain_wallet_mobile/src/features/common/presentation/text/clickable_span.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class TokensList extends StatelessWidget {
  const TokensList({
    required this.tokens,
    required this.tickerById,
    required this.chain,
    super.key,
  });

  final List<Token> tokens;
  final Map<String, Ticker> tickerById;
  final ChainType chain;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ListView(
      children: [
        ...tokens.map((e) {
          return TokenTile(
            token: e,
            chain: chain,
            ticker: tickerById[e.productId],
          );
        }),
        ClickableSpan(
          leading: s.importTokensLeading,
          title: s.importTokens,
          onTap: () {},
        ),
      ],
    );
  }
}
