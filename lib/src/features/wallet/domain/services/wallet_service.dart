import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:web3dart/web3dart.dart';

abstract class WalletService {
  Future<void> connect();

  Future<double> fetchBalance(String address);

  Stream<Ticker> fetchTickerStream(List<String> ids);

  Future<double> fetchBalanceBySymbol(
    String symbol,
    String address, {
    String? contractAddress,
  });

  Future<void> createAgent();

  Future<void> createSubAgent();

  Future<List<EthereumAddress>> addressesFromNetwork();

  Future<void> close();
}
