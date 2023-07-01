import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:equatable/equatable.dart';

class Wallet extends Equatable {
  const Wallet({
    required this.key,
    required this.name,
    required this.address,
    required this.type,
    required this.avatar,
  });

  const Wallet.network({
    required this.key,
    required this.name,
    required this.address,
    required this.avatar,
  }) : type = AccountType.agent;

  const Wallet.empty()
      : key = 0,
        name = '',
        address = '',
        type = AccountType.master,
        avatar = '';

  final int key;
  final String name;
  final String address;
  final AccountType type;
  final String avatar;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'key': key,
      'name': name,
      'address': address,
      'type': type.name,
      'avatar': avatar,
    };
  }

  @override
  List<Object?> get props => <Object?>[
    key,
    name,
    address,
    type,
    avatar,
  ];
}
