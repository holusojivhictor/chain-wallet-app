part of 'wallets_bloc.dart';

enum WalletsStatus {
  initial,
  loading,
  loaded,
}

class WalletsState extends Equatable {
  const WalletsState({
    required this.wallets,
    required this.status,
  });

  const WalletsState.init()
      : wallets = const <WalletAccount>[],
        status = WalletsStatus.initial;

  WalletsState copyWith({
    List<WalletAccount>? wallets,
    WalletsStatus? status,
  }) {
    return WalletsState(
      wallets: wallets ?? this.wallets,
      status: status ?? this.status,
    );
  }

  final List<WalletAccount> wallets;
  final WalletsStatus status;

  @override
  List<Object?> get props => <Object?>[
    wallets,
    status,
  ];
}
