import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallets_bloc.freezed.dart';
part 'wallets_event.dart';
part 'wallets_state.dart';

class WalletsBloc extends Bloc<WalletsEvent, WalletsState> {
  final DataService _dataService;

  WalletsBloc(this._dataService) : super(const WalletsState.loading()) {
    on<_Init>(_mapInitToState);
  }

  void _mapInitToState(_Init event, Emitter<WalletsState> emit) {
    final wallets = _dataService.getWalletAccounts();
    emit(WalletsState.loaded(wallets: wallets));
  }
}
