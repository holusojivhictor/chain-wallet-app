part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.init({
    @Default(true) bool connect,
  }) = _Init;

  const factory WalletEvent.restore() = _Restore;

  const factory WalletEvent.loadPrices() = _LoadPrices;

  const factory WalletEvent.loadBalance() = _LoadBalance;

  const factory WalletEvent.loadTokenBalance() = _LoadTokenBalance;

  const factory WalletEvent.createAgent() = _CreateAgent;

  const factory WalletEvent.createSubAgent() = _CreateSubAgent;

  const factory WalletEvent.scroll({
    required ItemScrollController itemScrollController,
    int? index,
  }) = _Scroll;

  const factory WalletEvent.refresh({
    @Default(false) bool init,
  }) = _Refresh;

  const factory WalletEvent.walletsLoaded({
    required List<Wallet> wallets,
  }) = _WalletsLoaded;

  const factory WalletEvent.walletLoaded({
    required Wallet wallet,
  }) = _WalletLoaded;

  const factory WalletEvent.tokenLoaded({
    required ChainType type,
    required Token token,
  }) = _TokenLoaded;

  const factory WalletEvent.tokenUpdated({
    required int key,
    required double balance,
  }) = _TokenUpdated;

  const factory WalletEvent.tickerLoaded({
    required String productId,
    required Ticker ticker,
  }) = _TickerLoaded;

  const factory WalletEvent.balanceLoading() = _BalanceLoading;

  const factory WalletEvent.balanceLoaded({
    required int index,
    required double balance,
  }) = _BalanceLoaded;

  const factory WalletEvent.networkChainChanged({
    required ChainType newValue,
  }) = _NetworkChainChanged;

  const factory WalletEvent.agentCreated() = _AgentCreated;

  const factory WalletEvent.activeWalletChanged({
    required int key,
    @Default(false) bool init,
  }) = _ActiveWalletChanged;

  const factory WalletEvent.walletUpdated({
    required double balance,
  }) = _WalletUpdated;
}

class TransactionEmitted implements BlocPresentationEvent {
  const TransactionEmitted();
}
