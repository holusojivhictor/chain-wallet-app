import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'RPC_URL')
  static const String rpcUrl = _Env.rpcUrl;

  @EnviedField(varName: 'WS_URL')
  static const String wsUrl = _Env.wsUrl;

  @EnviedField(varName: 'CONTRACT_ADDRESS')
  static const String contractAddress = _Env.contractAddress;

  @EnviedField(varName: 'NFT_STORAGE_API_KEY')
  static const String nftStorageApiKey = _Env.nftStorageApiKey;
}
