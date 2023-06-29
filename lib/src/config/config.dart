import 'package:chain_wallet_mobile/src/config/env.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';

class Config {
  factory Config() => _singleton;

  Config._internal();

  static final Config _singleton = Config._internal();

  static late String rpcUrl;
  static late String wsUrl;

  void initConfig(EthereumChain chain) {
    rpcUrl = _rpcUrl(chain);
    wsUrl = _wsUrl(chain);
  }

  String _rpcUrl(EthereumChain chain) => '${chain.rpcBase}/${Env.infuraApiKey}';

  String _wsUrl(EthereumChain chain) => '${chain.wsBase}/${Env.infuraApiKey}';

  static const String contractAddress = Env.contractAddress;

  static const String nftStorageApiKey = Env.nftStorageApiKey;
}
