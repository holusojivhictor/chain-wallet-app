part of 'session_bloc.dart';

@freezed
class SessionState with _$SessionState {
  const factory SessionState.unInitialized() = _UnInitializedState;

  const factory SessionState.onboardingState() = _OnboardingState;

  const factory SessionState.walletConnectState() = _WalletConnectState;

  const factory SessionState.importWalletState() = _ImportWalletState;

  const factory SessionState.createWalletState() = _CreateWalletState;

  const factory SessionState.authState({
    required String passcode,
  }) = _AuthState;

  const factory SessionState.authenticated() = _AuthenticatedState;
}
