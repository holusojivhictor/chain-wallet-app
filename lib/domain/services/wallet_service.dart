abstract class WalletService {
  Future<void> init();

  Future<void> createMaster();

  Future<void> importMasterFromMnemonic(String mnemonic);

  String get mnemonic;

  String get privateKey;
}
