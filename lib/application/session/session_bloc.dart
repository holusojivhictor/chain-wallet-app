import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_bloc.freezed.dart';
part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final SettingsService _settingsService;
  final ChainWalletAppService _appService;

  SessionBloc(
    this._settingsService,
    this._appService,
  ) : super(const SessionState.unInitialized()) {
    on<_AppStarted>((event, emit) async {
      await _appService.init();
      if (event.init) {
        await Future.delayed(const Duration(milliseconds: 2000));
      }

      if (_settingsService.isFirstInstall && !_appService.isWalletConnected) {
        return emit(const SessionState.onboardingState());
      } else if (!_appService.isWalletConnected) {
        return emit(const SessionState.walletConnectState());
      }

      emit(SessionState.authState(
        passcode: _appService.passcode,
      ));
    });

    on<_ConnectWallet>((event, emit) async {
      emit(const SessionState.walletConnectState());
    });

    on<_ImportWallet>((event, emit) async {
      emit(const SessionState.importWalletState());
    });

    on<_CreateWallet>((event, emit) async {
      emit(const SessionState.createWalletState());
    });

    on<_InitStartup>((event, emit) async {
      emit(const SessionState.authenticated());
    });
  }
}
