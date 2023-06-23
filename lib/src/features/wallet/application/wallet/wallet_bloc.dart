import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(this._dataService) : super(const WalletState.init()) {
    on<_Init>(_onInit);
  }
  final DataService _dataService;

  void _onInit(_Init event, Emitter<WalletState> emit) {
    final wallets = _dataService.getWalletAccounts();
    emit(
      state.copyWith(
        accounts: wallets,
        status: WalletStatus.loaded,
      ),
    );
  }
}
