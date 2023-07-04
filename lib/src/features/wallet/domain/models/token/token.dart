import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({
    required this.key,
    required this.name,
    required this.symbol,
    required this.chainId,
    required this.decimals,
  });

  final int key;
  final String name;
  final String symbol;
  final BigInt chainId;
  final BigInt decimals;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'symbol': symbol,
      'chainId': chainId,
      'decimals': decimals,
    };
  }

  String get productId => '$symbol-USD';

  String get avatar => name.substring(0, 1);

  @override
  List<Object?> get props => <Object?>[
    key,
    name,
    symbol,
    chainId,
    decimals,
  ];
}
