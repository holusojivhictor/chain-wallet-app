import 'package:equatable/equatable.dart';

class Token extends Equatable {
  const Token({
    required this.key,
    required this.name,
    required this.symbol,
    required this.chainId,
    required this.decimals,
    this.balance,
  });

  final int key;
  final String name;
  final String symbol;
  final BigInt chainId;
  final BigInt decimals;
  final double? balance;

  Token copyWith({
    double? balance,
  }) {
    return Token(
      key: key,
      name: name,
      symbol: symbol,
      chainId: chainId,
      decimals: decimals,
      balance: balance ?? this.balance,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'symbol': symbol,
      'chainId': chainId,
      'decimals': decimals,
      'balance': balance,
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
    balance,
  ];
}
