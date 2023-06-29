import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:web3dart/web3dart.dart';

abstract class WalletService {
  String get address;

  Future<EtherAmount> getBalance();

  Stream<Ticker> fetchTickerStream();

  Future<void> close();
}
