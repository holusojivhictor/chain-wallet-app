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
    required this.activeIndex,
    required this.latestPrice,
  });

  const WalletState.init()
      : wallets = const <Wallet>[],
        tickers = const <Ticker>[],
        tickerStatus = TickerStatus.initial,
        balanceStatus = BalanceStatus.initial,
        agentStatus = AgentStatus.idle,
        currentChain = EthereumChain.goerli,
        activeWallet = const Wallet.empty(),
        activeIndex = 0,
        latestPrice = zero;

  final List<Wallet> wallets;
  final List<Ticker> tickers;
  final TickerStatus tickerStatus;
  final BalanceStatus balanceStatus;
  final AgentStatus agentStatus;
  final EthereumChain currentChain;
  final Wallet activeWallet;
  final int activeIndex;
  final double latestPrice;

  WalletState copyWith({
    List<Wallet>? wallets,
    List<Ticker>? tickers,
    TickerStatus? tickerStatus,
    BalanceStatus? balanceStatus,
    AgentStatus? agentStatus,
    EthereumChain? currentChain,
    Wallet? activeWallet,
    int? activeIndex,
    double? latestPrice,
  }) {
    return WalletState(
      wallets: wallets ?? this.wallets,
      tickers: tickers ?? this.tickers,
      tickerStatus: tickerStatus ?? this.tickerStatus,
      balanceStatus: balanceStatus ?? this.balanceStatus,
      agentStatus: agentStatus ?? this.agentStatus,
      currentChain: currentChain ?? this.currentChain,
      activeWallet: activeWallet ?? this.activeWallet,
      activeIndex: activeIndex ?? this.activeIndex,
      latestPrice: latestPrice ?? this.latestPrice,
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
      latestPrice: ticker.price,
    );
  }

  WalletState copyWithActiveWalletUpdated({
    required int key,
  }) {
    final active = wallets.firstWhere((el) => el.key == key);
    return copyWith(
      activeWallet: active,
      activeIndex: wallets.indexOf(active),
    );
  }

  WalletState copyWithWalletUpdated({
    required double balance,
  }) {
    final walletList = List<Wallet>.from(wallets)
      ..removeAt(activeIndex)
      ..insert(
        activeIndex,
        activeWallet.copyWith(
          balance: balance,
          nativeBalance: balance * latestPrice,
        ),
      );

    return copyWith(
      wallets: walletList,
      activeWallet: walletList.elementAt(activeIndex),
      balanceStatus: BalanceStatus.loaded,
    );
  }

  WalletState copyWithBalanceUpdated({
    required int index,
    required double balance,
  }) {
    final walletList = List<Wallet>.from(wallets);
    final wallet = walletList.elementAt(index);
    walletList
      ..removeAt(index)
      ..insert(
        index,
        wallet.copyWith(
          balance: balance,
          nativeBalance: balance * latestPrice,
        ),
      );

    return copyWith(
      wallets: walletList,
      balanceStatus: BalanceStatus.loaded,
    );
  }

  WalletState copyWithRefreshed() {
    return copyWith();
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
    activeIndex,
    latestPrice,
  ];
}
