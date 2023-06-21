import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallets_bloc.freezed.dart';
part 'wallets_event.dart';
part 'wallets_state.dart';

class WalletsBloc extends Bloc<WalletsEvent, WalletsState> {
  WalletsBloc(this._dataService) : super(const WalletsState.init()) {
    on<_Init>(_onInit);
  }
  final DataService _dataService;

  void _onInit(_Init event, Emitter<WalletsState> emit) {
    final wallets = _dataService.getWalletAccounts();
    emit(
      state.copyWith(
        wallets: wallets,
        status: WalletsStatus.loaded,
      ),
    );
  }
}
