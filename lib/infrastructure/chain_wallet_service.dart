import 'package:chain_wallet_mobile/domain/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/domain/models/phrase/phrase_data.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:chain_wallet_mobile/presentation/shared/extensions/iterable_extensions.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ChainWalletServiceAppImpl implements ChainWalletAppService {
  final WalletService _walletService;
  late String _passcode;

  ChainWalletServiceAppImpl(this._walletService);

  final storage = const FlutterSecureStorage();
  final _lockPinKey = 'LockPinKey';

  @override
  String get mnemonic => _walletService.mnemonic;

  @override
  String get passcode => _passcode;

  @override
  bool get isWalletConnected => mnemonic.isNotNullEmptyOrWhitespace;

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
  List<PhraseData> getPhraseData() {
    final mnemonicList = mnemonic.split(' ');
    return mnemonicList.mapIndex((e, index) => PhraseData(position: index + 1, value: e)).toList();
  }

  @override
  Future<void> savePasscode(String value) async {
    await storage.write(key: _lockPinKey, value: value);
  }
}
