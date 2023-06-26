part of 'wallet_bloc.dart';

@freezed
class WalletEvent with _$WalletEvent {
  const factory WalletEvent.init() = _Init;

  const factory WalletEvent.tickersLoaded() = _TickersLoaded;

  const factory WalletEvent.tickerLoaded({
    required Ticker ticker,
  }) = _TickerLoaded;

  const factory WalletEvent.refresh() = _Refresh;
}
