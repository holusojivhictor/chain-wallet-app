import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';

abstract class AuthService {
  Future<void> init();

  Future<void> initChainClient();

  Future<void> fetchPasscode();

  Future<void> createMaster();

  Future<void> importMasterFromMnemonic(String mnemonic);

  Future<void> savePasscode(String value);

  List<Phrase> fetchPhrase();

  bool get isWalletConnected;

  String get passcode;

  String get publicKey;
}
