import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:web3dart/web3dart.dart';

abstract class WalletService {
  Future<void> connect();

  Future<EtherAmount> getBalance(String address);

  Stream<Ticker> fetchTickerStream();

  Future<void> createAgent();

  Future<void> createSubAgent();

  Future<void> close();
}
