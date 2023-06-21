import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';

abstract class AuthService {
  Future<void> init();

  Future<void> getPasscode();

  Future<void> savePasscode(String value);

  List<Phrase> getPhraseData();

  bool get isWalletConnected;

  String get passcode;
}
