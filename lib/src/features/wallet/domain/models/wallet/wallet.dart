import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  const Wallet({
    required this.key,
    required this.name,
    required this.address,
    required this.type,
    required this.avatar,
    this.balance,
    this.nativeBalance,
  });

  const Wallet.network({
    required this.key,
    required this.name,
    required this.address,
    required this.avatar,
  })  : type = AccountType.agent,
        balance = null,
        nativeBalance = null;

  const Wallet.empty()
      : key = 0,
        name = '',
        address = '',
        type = AccountType.master,
        avatar = '',
        balance = null,
        nativeBalance = null;

  final int key;
  final String name;
  final String address;
  final AccountType type;
  final String avatar;
  final double? balance;
  final double? nativeBalance;

  Wallet copyWith({
    double? balance,
    double? nativeBalance,
  }) {
    return Wallet(
      key: key,
      name: name,
      address: address,
      type: type,
      avatar: avatar,
      balance: balance ?? this.balance,
      nativeBalance: nativeBalance ?? this.nativeBalance,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'address': address,
      'type': type.name,
      'avatar': avatar,
      'balance': balance,
      'nativeBalance': nativeBalance,
    };
  }

  double get walletBalance => balance ?? 0;

  double get native => nativeBalance ?? 0;

  @override
  List<Object?> get props => <Object?>[
    key,
    name,
    address,
    type,
    avatar,
    balance,
    nativeBalance,
  ];
}
