import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/web3dart.dart';

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletBloc(
    this._dataService,
    this._preferenceService,
    this._authService,
    this._walletService,
  ) : super(const WalletState.init()) {
    on<_Init>(_onInit);
    on<_TickerLoaded>(_onTickerLoaded);
    on<_TickersLoaded>(_onTickersLoaded);
    on<_BalanceLoaded>(_onBalanceLoaded);
    on<_NetworkChainChanged>(_onNetworkChainChanged);
    on<_Refresh>(_onRefresh);
  }
  final DataService _dataService;
  final PreferenceService _preferenceService;
  final AuthService _authService;
  final WalletService _walletService;

  Future<void> _onInit(_Init event, Emitter<WalletState> emit) async {
    final preferences = _preferenceService.preferences;
    final wallets = _dataService.getWalletAccounts();
    emit(
      state.copyWith(
        accounts: wallets,
        currentChain: preferences.chain,
        currentAddress: _walletService.address,
        walletStatus: WalletStatus.loaded,
      ),
    );
    await _loadBalance();
    _loadTickers();
  }

  Future<void> _loadBalance() async {
    await _walletService.getBalance().then((amount) {
      final balance = amount.getValueInUnit(EtherUnit.ether);
      return add(WalletEvent.balanceLoaded(balance: balance));
    });
  }

  void _loadTickers() {
    _walletService
        .fetchTickerStream()
        .listen((ticker) => add(WalletEvent.tickerLoaded(ticker: ticker)))
        .onDone(() => add(const WalletEvent.tickersLoaded()));
  }

  Future<void> _onRefresh(_Refresh event, Emitter<WalletState> emit) async {
    emit(state.copyWithRefreshed());
    await _authService.initChainClient();

    await _loadBalance();
  }

  void _onTickerLoaded(_TickerLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithTickerAdded(ticker: event.ticker));
  }

  void _onTickersLoaded(_TickersLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWith(tickerStatus: TickerStatus.loaded));
  }

  void _onBalanceLoaded(_BalanceLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithBalanceUpdated(balance: event.balance));
  }

  void _onNetworkChainChanged(
    _NetworkChainChanged event,
    Emitter<WalletState> emit,
  ) {
    if (event.newValue == _preferenceService.chain) {
      return emit(state);
    }
    _preferenceService.chain = event.newValue;
    emit(state.copyWith(currentChain: event.newValue));
    add(const WalletEvent.refresh());
  }
}
