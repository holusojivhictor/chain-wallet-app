import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:equatable/equatable.dart';

class Ticker extends Equatable {
  const Ticker({
    required this.time,
    required this.productId,
    required this.price,
    required this.change,
  });

  Ticker.fromResponse(WebSocketResponse response)
      : time = response is TickerResponse ? response.timestamp : null,
        productId = response is TickerResponse
            ? response.events?.first.tickers?.first.productId
            : null,
        price = response is TickerResponse
            ? response.events?.first.tickers?.first.price
            : null,
        change = response is TickerResponse
            ? response.events?.first.tickers?.first.change
            : null;

  Ticker copyWith({
    DateTime? time,
    double? price,
    double? change,
  }) {
    return Ticker(
      productId: productId,
      time: time ?? this.time,
      price: price ?? this.price,
      change: change ?? this.change,
    );
  }

  final DateTime? time;
  final String? productId;
  final double? price;
  final double? change;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'time': time,
      'productId': productId,
      'price': price,
      'change': change,
    };
  }

  @override
  List<Object?> get props => <Object?>[
        time,
        productId,
        price,
        change,
      ];
}
