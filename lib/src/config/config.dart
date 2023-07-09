import 'package:chain_wallet_mobile/src/config/env.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';

class Config {
  factory Config() => _singleton;

  Config._internal();

  static final Config _singleton = Config._internal();

  static late String rpcUrl;
  static late String wsUrl;

  void initConfig(ChainType chain) {
    rpcUrl = _rpcUrl(chain);
    wsUrl = _wsUrl(chain);
  }

  String _rpcUrl(ChainType chain) => '${chain.rpcBase}/${Env.infuraApiKey}';

  String _wsUrl(ChainType chain) => '${chain.wsBase}/${Env.infuraApiKey}';

  static const String coinbaseApiKey = Env.coinbaseApiKey;

  static const String coinbaseSecret = Env.coinbaseSecret;

  static const String contractAddress = Env.contractAddress;

  static const String nftStorageApiKey = Env.nftStorageApiKey;
}
