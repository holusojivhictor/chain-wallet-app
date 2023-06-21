import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(const AuthState.init());

  final AuthService _authService;

  void init() {
    final connected = _authService.isWalletConnected;
    if (connected) {
      emit(state.copyWith(status: AuthStatus.connected));
    } else {
      emit(state.copyWith(status: AuthStatus.setup));
    }
  }
}
