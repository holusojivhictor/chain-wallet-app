import 'package:chain_wallet_mobile/src/extensions/iterable_extensions.dart';
import 'package:chain_wallet_mobile/src/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._walletService);

  final WalletService _walletService;
  late String _passcode;

  final storage = const FlutterSecureStorage();
  final _lockPinKey = 'LockPinKey';

  @override
  String get passcode => _passcode;

  @override
  bool get isWalletConnected => _walletService.mnemonic.isNotNullNorEmpty;

  @override
  Future<void> init() async {
    await Future.wait([
      getPasscode(),
    ]);
  }

  @override
  Future<void> getPasscode() async {
    _passcode = await storage.read(key: _lockPinKey) ?? '';
  }

  @override
  List<Phrase> getPhraseData() {
    final mnemonicList = _walletService.mnemonic.split(' ');
    return mnemonicList.mapIndex((e, index) => Phrase(position: index + 1)..value = e).toList();
  }

  @override
  Future<void> savePasscode(String value) async {
    await storage.write(key: _lockPinKey, value: value);
  }
}
