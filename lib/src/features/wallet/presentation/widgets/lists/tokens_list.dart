import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:flutter/material.dart';

class TokensList extends StatelessWidget {
  const TokensList({
    required this.tickers,
    super.key,
  });

  final List<Ticker> tickers;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...tickers.map((e) {
          return <Widget>[
            ListTile(
              title: Text(
                e.productId ?? 'Demo',
              ),
              subtitle: Text(
                '${e.price}',
              ),
            )
          ];
        }).expand((List<Widget> element) => element),
      ],
    );
  }
}
