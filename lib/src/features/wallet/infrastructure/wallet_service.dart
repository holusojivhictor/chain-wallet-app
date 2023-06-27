import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/infrastructure/exchange_client.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:web3dart/web3dart.dart';

class WalletServiceImpl implements WalletService {
  WalletServiceImpl(
    this._authService, {
    ExchangeClient? exchangeClient,
  }) : _exchangeClient = exchangeClient ?? ExchangeClient.anonymous();

  final ExchangeClient _exchangeClient;
  final AuthService _authService;

  static final web3Client = ChainWalletManager.instance.walletClient.client;

  @override
  EthereumChain get chain => _authService.chain;

  @override
  String get address => _authService.publicKey;

  @override
  Future<EtherAmount> getBalance() {
    return web3Client.getBalance(EthereumAddress.fromHex(address));
  }

  @override
  Stream<Ticker> fetchTickerStream() {
    final stream = _exchangeClient.subscribe(
      productIds: ['ETH-USD'],
    );

    return stream.map((event) => Ticker.fromResponse(event as TickerResponse));
  }

  @override
  Future<void> close() async {
    await _exchangeClient.close();
  }
}
