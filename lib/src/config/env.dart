import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'COINBASE_API_KEY')
  static const String coinbaseApiKey = _Env.coinbaseApiKey;

  @EnviedField(varName: 'COINBASE_SECRET')
  static const String coinbaseSecret = _Env.coinbaseSecret;

  @EnviedField(varName: 'INFURA_API_KEY')
  static const String infuraApiKey = _Env.infuraApiKey;

  @EnviedField(varName: 'CONTRACT_ADDRESS')
  static const String contractAddress = _Env.contractAddress;

  @EnviedField(varName: 'NFT_STORAGE_API_KEY')
  static const String nftStorageApiKey = _Env.nftStorageApiKey;
}
