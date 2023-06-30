import 'dart:typed_data';

import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:web3dart/web3dart.dart' as web3;

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState>
    implements WalletEventHandler {
  WalletBloc(
    this._dataService,
    this._preferenceService,
    this._authService,
    this._walletService,
  ) : super(const WalletState.init()) {
    ChainWalletManager.instance.addEventHandler('WalletEventListener', this);
    on<_Init>(_onInit);
    on<_TickerLoaded>(_onTickerLoaded);
    on<_TickersLoaded>(_onTickersLoaded);
    on<_WalletLoaded>(_onWalletLoaded);
    on<_BalanceLoaded>(_onBalanceLoaded);
    on<_ActiveWalletChanged>(_onActiveWalletChanged);
    on<_NetworkChainChanged>(_onNetworkChainChanged);
    on<_CreateAgent>(_onCreateAgent);
    on<_CreateSubAgent>(_onCreateSubAgent);
    on<_Refresh>(_onRefresh);
  }
  final DataService _dataService;
  final PreferenceService _preferenceService;
  final AuthService _authService;
  final WalletService _walletService;

  Future<void> _onInit(_Init event, Emitter<WalletState> emit) async {
    await _walletService.connect();
    final preferences = _preferenceService.preferences;
    emit(state.copyWith(currentChain: preferences.chain));

    _loadLocalWallets();
    _loadTickers();
    await _loadBalance();
  }

  void _loadLocalWallets() {
    final wallets = _dataService.getWallets();
    for (final wallet in wallets) {
      add(WalletEvent.walletLoaded(wallet: wallet));
    }
    final prefs = _preferenceService.preferences;
    add(WalletEvent.activeWalletChanged(key: prefs.activeWalletId, init: true));
  }

  Future<void> _loadBalance() async {
    await _walletService.getBalance(state.activeWallet.address).then((amount) {
      final balance = amount.getValueInUnit(web3.EtherUnit.ether);
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
    if (event.init) {
      await _authService.initChainClient();
    }

    await _loadBalance();
  }

  void _onTickerLoaded(_TickerLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithTickerAdded(ticker: event.ticker));
  }

  void _onTickersLoaded(_TickersLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWith(tickerStatus: TickerStatus.loaded));
  }

  void _onWalletLoaded(_WalletLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithWalletAdded(wallet: event.wallet));
  }

  void _onBalanceLoaded(_BalanceLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithBalanceUpdated(balance: event.balance));
  }

  void _onActiveWalletChanged(
    _ActiveWalletChanged event,
    Emitter<WalletState> emit,
  ) {
    if (!event.init) {
      if (event.key == _preferenceService.activeWalletId) {
        return emit(state);
      }
    }
    _preferenceService.activeWalletId = event.key;
    emit(state.copyWithActiveWalletUpdated(key: event.key));
    if (!event.init) add(const WalletEvent.refresh());
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
    add(const WalletEvent.refresh(init: true));
  }

  Future<void> _onCreateAgent(_CreateAgent event, Emitter<WalletState> emit) {
    return ChainWalletManager.instance.createWallet();
  }

  Future<void> _onCreateSubAgent(
    _CreateSubAgent event,
    Emitter<WalletState> emit,
  ) {
    return ChainWalletManager.instance.createSubWallet();
  }

  @override
  void Function(web3.EthereumAddress agent)? get onAgentDeployed {
    return (address) async {
      final key = await _dataService.saveWallet(
        AccountType.agent,
        address.hex,
      );

      final wallet = _dataService.getWallets().firstWhere((e) => e.key == key);
      add(WalletEvent.walletLoaded(wallet: wallet));
    };
  }

  @override
  void Function(
    Uint8List hash,
    web3.TransactionReceipt? receipt,
  )? get onTransactionEmitted {
    return null;
  }

  @override
  Future<void> close() {
    ChainWalletManager.instance.removeEventHandler('WalletEventListener');
    return super.close();
  }
}
