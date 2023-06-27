part of 'wallet_bloc.dart';

enum WalletStatus {
  initial,
  loading,
  loaded,
}

enum TickerStatus {
  initial,
  loading,
  loaded,
}

class WalletState extends Equatable {
  const WalletState({
    required this.accounts,
    required this.tickers,
    required this.walletStatus,
    required this.tickerStatus,
    required this.currentChain,
    required this.currentAddress,
    required this.balance,
  });

  const WalletState.init()
      : accounts = const <WalletAccount>[],
        tickers = const <Ticker>[],
        walletStatus = WalletStatus.initial,
        tickerStatus = TickerStatus.initial,
        currentChain = EthereumChain.goerli,
        currentAddress = '0x00',
        balance = 0;

  final List<WalletAccount> accounts;
  final List<Ticker> tickers;
  final WalletStatus walletStatus;
  final TickerStatus tickerStatus;
  final EthereumChain currentChain;
  final String currentAddress;
  final double balance;

  WalletState copyWith({
    List<WalletAccount>? accounts,
    List<Ticker>? tickers,
    WalletStatus? walletStatus,
    TickerStatus? tickerStatus,
    EthereumChain? currentChain,
    String? currentAddress,
    double? balance,
  }) {
    return WalletState(
      accounts: accounts ?? this.accounts,
      tickers: tickers ?? this.tickers,
      walletStatus: walletStatus ?? this.walletStatus,
      tickerStatus: tickerStatus ?? this.tickerStatus,
      currentChain: currentChain ?? this.currentChain,
      currentAddress: currentAddress ?? this.currentAddress,
      balance: balance ?? this.balance,
    );
  }

  WalletState copyWithTickerAdded({
    required Ticker ticker,
  }) {
    final newList = List<Ticker>.from(tickers);
    final index = newList.indexWhere((el) => el.productId == ticker.productId);

    if (index.isNegative) {
      newList.add(ticker);
    } else {
      newList
        ..removeAt(index)
        ..insert(index, ticker);
    }
    return copyWith(
      tickers: newList,
    );
  }

  WalletState copyWithRefreshed() {
    return copyWith(
      accounts: <WalletAccount>[],
      tickers: <Ticker>[],
      walletStatus: WalletStatus.loading,
      tickerStatus: TickerStatus.loading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    accounts,
    tickers,
    walletStatus,
    tickerStatus,
    currentChain,
    currentAddress,
    balance,
  ];
}
