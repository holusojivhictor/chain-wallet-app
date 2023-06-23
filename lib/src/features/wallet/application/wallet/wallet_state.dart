part of 'wallet_bloc.dart';

enum WalletStatus {
  initial,
  loading,
  loaded,
}

class WalletState extends Equatable {
  const WalletState({
    required this.accounts,
    required this.status,
  });

  const WalletState.init()
      : accounts = const <WalletAccount>[],
        status = WalletStatus.initial;

  WalletState copyWith({
    List<WalletAccount>? accounts,
    WalletStatus? status,
  }) {
    return WalletState(
      accounts: accounts ?? this.accounts,
      status: status ?? this.status,
    );
  }

  final List<WalletAccount> accounts;
  final WalletStatus status;

  @override
  List<Object?> get props => <Object?>[
    accounts,
    status,
  ];
}
