part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.init() = _Init;

  const factory WalletEvent.walletLoaded({
    required Wallet wallet,
  }) = _WalletLoaded;

  const factory WalletEvent.tickersLoaded() = _TickersLoaded;

  const factory WalletEvent.tickerLoaded({
    required Ticker ticker,
  }) = _TickerLoaded;

  const factory WalletEvent.balanceLoaded({
    required double balance,
  }) = _BalanceLoaded;

  const factory WalletEvent.activeWalletChanged({
    required int key,
    @Default(false) bool init,
  }) = _ActiveWalletChanged;

  const factory WalletEvent.networkChainChanged({
    required EthereumChain newValue,
  }) = _NetworkChainChanged;

  const factory WalletEvent.createAgent() = _CreateAgent;

  const factory WalletEvent.createSubAgent() = _CreateSubAgent;

  const factory WalletEvent.refresh({
    @Default(false) bool init,
  }) = _Refresh;
}
