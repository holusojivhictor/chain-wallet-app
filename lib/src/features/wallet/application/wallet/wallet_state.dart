part of 'wallet_bloc.dart';

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

enum AgentStatus {
  idle,
  loading,
  loaded,
}

const double zero = 0;

class WalletState extends Equatable {
  const WalletState({
    required this.wallets,
    required this.tickers,
    required this.tickerStatus,
    required this.balanceStatus,
    required this.agentStatus,
    required this.currentChain,
    required this.activeWallet,
    required this.balance,
    required this.nativeBalance,
  });

  const WalletState.init()
      : wallets = const <Wallet>[],
        tickers = const <Ticker>[],
        tickerStatus = TickerStatus.initial,
        balanceStatus = BalanceStatus.initial,
        agentStatus = AgentStatus.idle,
        currentChain = EthereumChain.goerli,
        activeWallet = const Wallet.empty(),
        balance = zero,
        nativeBalance = zero;

  final List<Wallet> wallets;
  final List<Ticker> tickers;
  final TickerStatus tickerStatus;
  final BalanceStatus balanceStatus;
  final AgentStatus agentStatus;
  final EthereumChain currentChain;
  final Wallet activeWallet;
  final double balance;
  final double nativeBalance;

  WalletState copyWith({
    List<Wallet>? wallets,
    List<Ticker>? tickers,
    TickerStatus? tickerStatus,
    BalanceStatus? balanceStatus,
    AgentStatus? agentStatus,
    EthereumChain? currentChain,
    Wallet? activeWallet,
    double? balance,
    double? nativeBalance,
  }) {
    return WalletState(
      wallets: wallets ?? this.wallets,
      tickers: tickers ?? this.tickers,
      tickerStatus: tickerStatus ?? this.tickerStatus,
      balanceStatus: balanceStatus ?? this.balanceStatus,
      agentStatus: agentStatus ?? this.agentStatus,
      currentChain: currentChain ?? this.currentChain,
      activeWallet: activeWallet ?? this.activeWallet,
      balance: balance ?? this.balance,
      nativeBalance: nativeBalance ?? this.nativeBalance,
    );
  }

  WalletState copyWithWalletAdded({
    required Wallet wallet,
  }) {
    final newList = List<Wallet>.from(wallets)..add(wallet);

    return copyWith(
      wallets: newList,
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

  WalletState copyWithActiveWalletUpdated({
    required int key,
  }) {
    final active = wallets.firstWhere((el) => el.key == key);
    return copyWith(
      activeWallet: active,
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
    wallets,
    tickers,
    tickerStatus,
    balanceStatus,
    agentStatus,
    currentChain,
    activeWallet,
    balance,
    nativeBalance,
  ];
}
