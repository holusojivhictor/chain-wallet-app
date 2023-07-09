import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/config/config.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/infrastructure/exchange_client.dart';
import 'package:web3dart/web3dart.dart';

class WalletServiceImpl implements WalletService {
  WalletServiceImpl({
    ExchangeClient? client,
  }) : _client = client ??
            ExchangeClient(Config.coinbaseApiKey, Config.coinbaseSecret);

  final ExchangeClient _client;

  Web3Client get web3Client => ChainWalletManager.instance.walletClient.client;

  Stream<WebSocketResponse>? _stream;

  @override
  Future<double> fetchBalance(String addr) async {
    final amount = await web3Client.getBalance(EthereumAddress.fromHex(addr));
    return amount.getValueInUnit(EtherUnit.ether);
  }

  @override
  Future<void> connect() {
    return ChainWalletManager.instance.connect();
  }

  @override
  Stream<Ticker> fetchTickerStream(List<String> ids) {
    _stream = _client.subscribe(
      productIds: ids,
    );

    return _stream!.map(Ticker.fromResponse);
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
  Future<List<EthereumAddress>> addressesFromNetwork() async {
    var addresses = <EthereumAddress>[];
    try {
      final agents = await ChainWalletManager.instance.getSubWallets();
      addresses = agents;
    } catch (_) {}
    return addresses;
  }

  @override
  Future<void> close() async {
    _stream = null;
    await _client.close();
  }
}
