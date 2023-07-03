import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:equatable/equatable.dart';

class Ticker extends Equatable {
  const Ticker({
    required this.time,
    required this.productId,
    required this.price,
  });

  Ticker.fromResponse(WebSocketResponse response)
      : time = response is TickerResponse ? response.time : null,
        productId = response is TickerResponse ? response.productId : null,
        price = response is TickerResponse ? response.price : null;

  Ticker copyWith({
    DateTime? time,
    double? price,
  }) {
    return Ticker(
      productId: productId,
      time: time ?? this.time,
      price: price ?? this.price,
    );
  }

  final DateTime? time;
  final String? productId;
  final double? price;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'time': time,
      'productId': productId,
      'price': price,
    };
  }

  @override
  List<Object?> get props => <Object?>[
    time,
    productId,
    price,
  ];
}
