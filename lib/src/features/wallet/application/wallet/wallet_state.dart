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

enum BalanceStatus {
  initial,
  loading,
  loaded,
}

const double zero = 0;

class WalletState extends Equatable {
  const WalletState({
    required this.accounts,
    required this.tickers,
    required this.walletStatus,
    required this.tickerStatus,
    required this.balanceStatus,
    required this.currentChain,
    required this.currentAddress,
    required this.balance,
    required this.nativeBalance,
  });

  const WalletState.init()
      : accounts = const <WalletAccount>[],
        tickers = const <Ticker>[],
        walletStatus = WalletStatus.initial,
        tickerStatus = TickerStatus.initial,
        balanceStatus = BalanceStatus.initial,
        currentChain = EthereumChain.goerli,
        currentAddress = '0x00',
        balance = zero,
        nativeBalance = zero;

  final List<WalletAccount> accounts;
  final List<Ticker> tickers;
  final WalletStatus walletStatus;
  final TickerStatus tickerStatus;
  final BalanceStatus balanceStatus;
  final EthereumChain currentChain;
  final String currentAddress;
  final double balance;
  final double nativeBalance;

  WalletState copyWith({
    List<WalletAccount>? accounts,
    List<Ticker>? tickers,
    WalletStatus? walletStatus,
    TickerStatus? tickerStatus,
    BalanceStatus? balanceStatus,
    EthereumChain? currentChain,
    String? currentAddress,
    double? balance,
    double? nativeBalance,
  }) {
    return WalletState(
      accounts: accounts ?? this.accounts,
      tickers: tickers ?? this.tickers,
      walletStatus: walletStatus ?? this.walletStatus,
      tickerStatus: tickerStatus ?? this.tickerStatus,
      balanceStatus: balanceStatus ?? this.balanceStatus,
      currentChain: currentChain ?? this.currentChain,
      currentAddress: currentAddress ?? this.currentAddress,
      balance: balance ?? this.balance,
      nativeBalance: nativeBalance ?? this.nativeBalance,
    );
  }

  WalletState copyWithTickerAdded({
    required Ticker ticker,
  }) {
    final newList = List<Ticker>.from(tickers);
    var newBalance = nativeBalance;
    final index = newList.indexWhere((el) => el.productId == ticker.productId);

    if (index.isNegative) {
      newList.add(ticker);
    } else {
      newList
        ..removeAt(index)
        ..insert(index, ticker);
      if (ticker.price != null) {
        newBalance = balance * ticker.price!;
      }
    }
    return copyWith(
      tickers: newList,
      nativeBalance: newBalance,
    );
  }

  WalletState copyWithBalanceUpdated({
    required double balance,
  }) {
    return copyWith(
      balance: balance,
      balanceStatus: BalanceStatus.loaded,
    );
  }

  WalletState copyWithRefreshed() {
    return copyWith(
      balance: zero,
      nativeBalance: zero,
      balanceStatus: BalanceStatus.loading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    accounts,
    tickers,
    walletStatus,
    tickerStatus,
    balanceStatus,
    currentChain,
    currentAddress,
    balance,
    nativeBalance,
  ];
}
