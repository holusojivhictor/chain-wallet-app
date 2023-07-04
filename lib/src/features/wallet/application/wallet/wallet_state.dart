part of 'wallet_bloc.dart';

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

const String ethProduct = 'ETH-USD';
const double zero = 0;

class WalletState extends Equatable {
  const WalletState({
    required this.wallets,
    required this.tokensByChain,
    required this.tickerById,
    required this.balanceStatus,
    required this.agentStatus,
    required this.currentChain,
    required this.activeWallet,
    required this.activeIndex,
    required this.latestPrice,
  });

  const WalletState.init()
      : wallets = const <Wallet>[],
        tokensByChain = const <ChainType, List<Token>>{
          ChainType.mainnet: <Token>[],
          ChainType.goerli: <Token>[],
          ChainType.sepolia: <Token>[],
        },
        tickerById = const <String, Ticker>{},
        balanceStatus = BalanceStatus.initial,
        agentStatus = AgentStatus.idle,
        currentChain = ChainType.goerli,
        activeWallet = const Wallet.empty(),
        activeIndex = 0,
        latestPrice = zero;

  final List<Wallet> wallets;
  final Map<ChainType, List<Token>> tokensByChain;
  final Map<String, Ticker> tickerById;
  final BalanceStatus balanceStatus;
  final AgentStatus agentStatus;
  final ChainType currentChain;
  final Wallet activeWallet;
  final int activeIndex;
  final double latestPrice;

  WalletState copyWith({
    List<Wallet>? wallets,
    List<Ticker>? tickers,
    Map<ChainType, List<Token>>? tokensByChain,
    Map<String, Ticker>? tickerById,
    BalanceStatus? balanceStatus,
    AgentStatus? agentStatus,
    ChainType? currentChain,
    Wallet? activeWallet,
    int? activeIndex,
    double? latestPrice,
  }) {
    return WalletState(
      wallets: wallets ?? this.wallets,
      tokensByChain: tokensByChain ?? this.tokensByChain,
      tickerById: tickerById ?? this.tickerById,
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

  WalletState copyWithTokenAdded({
    required ChainType type,
    required Token token,
  }) {
    final newMap = Map<ChainType, List<Token>>.from(tokensByChain);
    newMap[type] = List<Token>.from(newMap[type]!)..add(token);

    return copyWith(
      tokensByChain: newMap,
    );
  }

  WalletState copyWithTickerUpdated({
    required String productId,
    required Ticker ticker,
  }) {
    final newMap = Map<String, Ticker>.from(tickerById);
    newMap[productId] = ticker;

    return copyWith(
      tickerById: newMap,
      latestPrice: newMap[ethProduct]?.price,
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
    tokensByChain,
    tickerById,
    balanceStatus,
    agentStatus,
    currentChain,
    activeWallet,
    activeIndex,
    latestPrice,
  ];
}
