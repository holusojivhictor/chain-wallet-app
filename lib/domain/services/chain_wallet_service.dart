import 'package:chain_wallet_mobile/domain/models/models.dart';

abstract class ChainWalletAppService {
  Future<void> init();

  Future<void> getPasscode();

  Future<void> savePasscode(String value);

  List<PhraseData> getPhraseData();

  bool get isWalletConnected;

  String get mnemonic;

  String get passcode;
}
