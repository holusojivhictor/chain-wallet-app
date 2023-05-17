part of 'session_bloc.dart';

@freezed
class SessionEvent with _$SessionEvent {
  const factory SessionEvent.appStarted({required bool init}) = _AppStarted;

  const factory SessionEvent.connectWallet() = _ConnectWallet;

  const factory SessionEvent.importWallet() = _ImportWallet;

  const factory SessionEvent.createWallet() = _CreateWallet;

  const factory SessionEvent.initStartup() = _InitStartup;
}
