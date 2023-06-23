import 'package:web3dart/web3dart.dart';

abstract class WalletService {
  Future<EtherAmount> balance();
}
