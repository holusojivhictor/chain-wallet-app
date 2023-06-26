import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(
    this._dataService,
    this._walletService,
  ) : super(const WalletState.init()) {
    on<_Init>(_onInit);
    on<_TickerLoaded>(_onTickerLoaded);
    on<_TickersLoaded>(_onTickersLoaded);
  }
  final DataService _dataService;
  final WalletService _walletService;

  void _onInit(_Init event, Emitter<WalletState> emit) {
    final wallets = _dataService.getWalletAccounts();
    emit(
      state.copyWith(
        accounts: wallets,
        walletStatus: WalletStatus.loaded,
      ),
    );
    _loadTickers();
  }

  void _loadTickers() {
    _walletService
        .fetchTickerStream()
        .listen((ticker) => add(WalletEvent.tickerLoaded(ticker: ticker)))
        .onDone(() => add(const WalletEvent.tickersLoaded()));
  }

  void _onTickerLoaded(_TickerLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithTickerAdded(ticker: event.ticker));
  }

  void _onTickersLoaded(_TickersLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWith(tickerStatus: TickerStatus.loaded));
  }
}
