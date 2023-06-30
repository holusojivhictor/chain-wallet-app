import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/infrastructure/exchange_client.dart';
import 'package:web3dart/web3dart.dart';

class WalletServiceImpl implements WalletService {
  WalletServiceImpl({
    ExchangeClient? exchangeClient,
  }) : _exchangeClient = exchangeClient ?? ExchangeClient.anonymous();

  final ExchangeClient _exchangeClient;

  Web3Client get web3Client => ChainWalletManager.instance.walletClient.client;

  @override
  Future<EtherAmount> getBalance(String address) {
    return web3Client.getBalance(EthereumAddress.fromHex(address));
  }

  @override
  Future<void> connect() {
    return ChainWalletManager.instance.connect();
  }

  @override
  Stream<Ticker> fetchTickerStream() {
    final stream = _exchangeClient.subscribe(
      productIds: ['ETH-USD'],
    );

    return stream.map((event) => Ticker.fromResponse(event as TickerResponse));
  }

  @override
  Future<void> createAgent() async {
    try {
      await ChainWalletManager.instance.createWallet();
    } catch (_) {}
  }

  @override
  Future<void> createSubAgent() async {
    try {
      await ChainWalletManager.instance.createSubWallet();
    } catch (_) {}
  }

  @override
  Future<void> close() async {
    await _exchangeClient.close();
  }
}
