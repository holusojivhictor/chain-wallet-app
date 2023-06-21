import 'package:chain_wallet_mobile/src/config/env.dart';

class Config {
  Config._();

  static const String rpcUrl = Env.rpcUrl;

  static const String wsUrl = Env.wsUrl;

  static const String contractAddress = Env.contractAddress;

  static const String nftStorageApiKey = Env.nftStorageApiKey;
}
