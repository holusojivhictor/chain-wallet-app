import 'dart:async';
import 'dart:typed_data';

import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/send/send_cubit.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:web3dart/web3dart.dart' as web3;

part 'wallet_bloc.freezed.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

const String _identifier = 'WalletBlocListener';

class WalletBloc extends Bloc<WalletEvent, WalletState>
    with BlocPresentationMixin
    implements WalletEventHandler {
  WalletBloc(
    this._dataService,
    this._preferenceService,
    this._authService,
    this._walletService,
    this._authCubit,
    this._sendCubit,
  ) : super(const WalletState.init()) {
    ChainWalletManager.instance.addEventHandler(_identifier, this);
    on<_Init>(_onInit);
    on<_Restore>(_onRestore);
    on<_LoadPrices>(_onLoadPrices);
    on<_LoadBalance>(_onLoadBalance);
    on<_LoadTokenBalance>(_onLoadTokenBalance);
    on<_CreateAgent>(_onCreateAgent);
    on<_CreateSubAgent>(_onCreateSubAgent);
    on<_TickerLoaded>(_onTickerLoaded);
    on<_WalletsLoaded>(_onWalletsLoaded);
    on<_WalletLoaded>(_onWalletLoaded);
    on<_TokenLoaded>(_onTokenLoaded);
    on<_TokenUpdated>(_onTokenUpdated);
    on<_BalanceLoading>(_onBalanceLoading);
    on<_BalanceLoaded>(_onBalanceLoaded);
    on<_AgentCreated>(_onAgentCreated);
    on<_ActiveWalletChanged>(_onActiveWalletChanged);
    on<_NetworkChainChanged>(_onNetworkChainChanged);
    on<_WalletUpdated>(_onWalletUpdated);
    on<_Refresh>(_onRefresh);
    on<_Scroll>(_onScroll);
  }
  final DataService _dataService;
  final PreferenceService _preferenceService;
  final AuthService _authService;
  final WalletService _walletService;
  final AuthCubit _authCubit;
  final SendCubit _sendCubit;

  StreamSubscription<Ticker>? _streamSubscription;
  bool firstLoaded = true;

  Future<void> _onInit(_Init event, Emitter<WalletState> emit) async {
    if (event.connect) {
      await _walletService.connect();
    }
    final preferences = _preferenceService.preferences;
    emit(state.copyWith(currentChain: preferences.chain));

    _initDatabase();
  }

  void _initDatabase() {
    _loadLocalWallets();
    for (final type in ChainType.values) {
      _loadTokens(type: type);
    }
  }

  void _loadLocalWallets() {
    final wallets = _dataService.getWallets();
    add(WalletEvent.walletsLoaded(wallets: wallets));
    final prefs = _preferenceService.preferences;
    add(WalletEvent.activeWalletChanged(key: prefs.activeWalletId, init: true));
  }

  void _loadTokens({required ChainType type}) {
    final tokens = _dataService.getTokens();
    for (final token in tokens) {
      if (token.chainId == BigInt.from(type.id)) {
        add(WalletEvent.tokenLoaded(type: type, token: token));
      }
    }
  }

  void _loadTickers() {
    final ids = state.tokensByChain[state.currentChain]!
        .map((e) => e.productId)
        .toList();

    _streamSubscription = _walletService
        .fetchTickerStream(ids)
        .listen(_onTickerFetched)..onDone(_onDone);
    add(const WalletEvent.loadTokenBalance());
  }

  Future<void> _loadTokenBalance() async {
    final tokens = state.tokensByChain[state.currentChain]!;

    for (final token in tokens) {
      final balance = await _walletService.fetchBalanceBySymbol(
        token.symbol,
        state.activeWallet.address,
      );
      add(WalletEvent.tokenUpdated(key: token.key, balance: balance));
    }
  }

  Future<void> _loadBalance() async {
    await _updateActive();
    _authCubit.start();
    final addresses = state.wallets.map((e) => e.address).toList();
    for (final address in addresses) {
      final index = addresses.indexOf(address);
      if (index == state.activeIndex) continue;

      add(const WalletEvent.balanceLoading());
      final balance = await _walletService.fetchBalance(address);
      add(WalletEvent.balanceLoaded(index: index, balance: balance));
    }
  }

  void _onLoadPrices(_LoadPrices event, Emitter<WalletState> emit) {
    _loadTickers();
  }

  Future<void> _onRestore(_Restore event, Emitter<WalletState> emit) {
    return _restore();
  }

  Future<void> _onLoadBalance(_LoadBalance event, Emitter<WalletState> emit) {
    return _loadBalance();
  }

  Future<void> _onLoadTokenBalance(
    _LoadTokenBalance event,
    Emitter<WalletState> emit,
  ) {
    return _loadTokenBalance();
  }

  Future<void> _onRefresh(_Refresh event, Emitter<WalletState> emit) async {
    emit(state.copyWithRefreshed());
    await _streamSubscription?.cancel();
    await _walletService.close();

    if (event.init) {
      await _authService.initChainClient();
    }

    await _loadBalance();
    _loadTickers();
  }

  Future<void> _onCreateAgent(_CreateAgent event, Emitter<WalletState> emit) {
    emit(state.copyWith(agentStatus: AgentStatus.loading));
    return ChainWalletManager.instance.createWallet();
  }

  Future<void> _onCreateSubAgent(
    _CreateSubAgent event,
    Emitter<WalletState> emit,
  ) {
    emit(state.copyWith(agentStatus: AgentStatus.loading));
    return ChainWalletManager.instance.createSubWallet();
  }

  void _onTickerLoaded(_TickerLoaded event, Emitter<WalletState> emit) {
    emit(
      state.copyWithTickerUpdated(
        productId: event.productId,
        ticker: event.ticker,
      ),
    );
  }

  void _onWalletsLoaded(_WalletsLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWith(wallets: event.wallets));
  }

  void _onWalletLoaded(_WalletLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithWalletAdded(wallet: event.wallet));
  }

  void _onWalletUpdated(_WalletUpdated event, Emitter<WalletState> emit) {
    emit(state.copyWithWalletUpdated(balance: event.balance));
  }

  void _onTokenLoaded(_TokenLoaded event, Emitter<WalletState> emit) {
    emit(state.copyWithTokenAdded(type: event.type, token: event.token));
  }

  void _onTokenUpdated(_TokenUpdated event, Emitter<WalletState> emit) {
    emit(state.copyWithTokenUpdated(key: event.key, balance: event.balance));
  }

  void _onBalanceLoading(_BalanceLoading event, Emitter<WalletState> emit) {
    emit(state.copyWith(balanceStatus: BalanceStatus.loading));
  }

  void _onBalanceLoaded(_BalanceLoaded event, Emitter<WalletState> emit) {
    emit(
      state.copyWithBalanceUpdated(
        index: event.index,
        balance: event.balance,
      ),
    );
  }

  void _onAgentCreated(_AgentCreated event, Emitter<WalletState> emit) {
    emit(state.copyWith(agentStatus: AgentStatus.loaded));
  }

  void _onActiveWalletChanged(
    _ActiveWalletChanged event,
    Emitter<WalletState> emit,
  ) {
    if (!event.init) {
      if (event.key == _preferenceService.activeWalletId) return emit(state);
    }
    _preferenceService.activeWalletId = event.key;
    emit(state.copyWithActiveWalletUpdated(key: event.key));
    add(const WalletEvent.loadTokenBalance());
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
    _sendCubit.init();
  }

  void _onScroll(_Scroll event, Emitter<WalletState> emit) {
    final active = state.activeWallet;
    final index = state.wallets.indexWhere((e) => e.key == active.key);
    event.itemScrollController.scrollTo(
      index: event.index ?? index,
      alignment: 0.2,
      duration: const Duration(milliseconds: 200),
    );
  }

  Future<void> _restore() async {
    await _walletService.connect();
    await Future.wait([
      _saveWalletsFromNetwork(),
      _saveEthTokens(),
    ]);
  }

  Future<void> _saveWalletsFromNetwork() async {
    final addresses = await _walletService.addressesFromNetwork();
    if (addresses.isNotEmpty) {
      for (final address in addresses) {
        await _dataService.saveWallet(AccountType.agent, address.hex);
      }
    }
  }

  Future<void> _saveEthTokens() async {
    for (final chain in ChainType.values) {
      await _dataService.saveToken(
        chain.name,
        ChainType.mainnet.currency,
        BigInt.from(chain.id),
        BigInt.from(18),
      );
    }
  }

  Future<void> _updateActive() async {
    add(const WalletEvent.balanceLoading());
    final active = state.activeWallet.address;
    final balance = await _walletService.fetchBalance(active);
    return add(WalletEvent.walletUpdated(balance: balance));
  }

  void _onTickerFetched(Ticker ticker) {
    if (firstLoaded) add(const WalletEvent.loadBalance());
    firstLoaded = false;
    add(
      WalletEvent.tickerLoaded(
        productId: ticker.productId ?? ethProduct,
        ticker: ticker,
      ),
    );
  }

  void _onDone() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    _walletService.close();
  }

  @override
  void Function(web3.EthereumAddress agent)? get onAgentDeployed {
    return (address) async {
      final key = await _dataService.saveWallet(AccountType.agent, address.hex);

      final wallet = _dataService.getWallets().firstWhere((e) => e.key == key);
      add(WalletEvent.walletLoaded(wallet: wallet));
      add(const WalletEvent.agentCreated());
    };
  }

  @override
  void Function(
    Uint8List hash,
    web3.TransactionReceipt? receipt,
  )? get onTransactionEmitted {
    return (txHash, _) async {
      emitPresentation(const TransactionEmitted());
      await _updateActive();
    };
  }

  @override
  Future<void> close() async {
    ChainWalletManager.instance.removeEventHandler(_identifier);
    await _streamSubscription?.cancel();
    await _walletService.close();
    return super.close();
  }
}
