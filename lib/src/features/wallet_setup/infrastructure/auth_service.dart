import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/src/config/config.dart';
import 'package:chain_wallet_mobile/src/extensions/iterable_extensions.dart';
import 'package:chain_wallet_mobile/src/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:dice_bear/dice_bear.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web3dart/credentials.dart';

class AuthServiceImpl implements AuthService {
  AuthServiceImpl(
    this._logger,
    this._preferenceService,
    this._dataService,
  );

  final LoggingService _logger;
  final PreferenceService _preferenceService;
  final DataService _dataService;

  late String _passcode;
  late String _mnemonic;
  late String _publicKey;

  final provider = ChainWalletManager.instance.storageProvider;
  final storage = const FlutterSecureStorage();

  final _lockPinKey = 'LockPinKey';

  @override
  String get passcode => _passcode;

  @override
  String get publicKey => _publicKey;

  @override
  bool get isWalletConnected => _mnemonic.isNotNullNorEmpty;

  @override
  Future<void> init() async {
    await Future.wait([
      fetchPasscode(),
      initChainClient(),
      _refresh(),
    ]);
  }

  @override
  Future<void> fetchPasscode() async {
    _passcode = await storage.read(key: _lockPinKey) ?? '';
  }

  @override
  Future<void> initChainClient() async {
    Config().initConfig(_preferenceService.chain);

    final config = ChainWalletClientConfig(
      rpcUrl: Config.rpcUrl,
      wsUrl: Config.wsUrl,
      contractAddress: EthereumAddress.fromHex(Config.contractAddress),
      nftStorageApiKey: Config.nftStorageApiKey,
    );

    await ChainWalletManager.instance.init(config);
  }

  @override
  List<Phrase> fetchPhrase() {
    final mnemonicList = _mnemonic.split(' ');
    return mnemonicList
        .mapIndex((e, index) => Phrase(position: index + 1)..value = e)
        .toList();
  }

  @override
  Future<void> createMaster() async {
    try {
      final keys = await ChainWalletManager.instance.createMasterWallet();
      await _refresh();
      final avatar = _generateAvatar(keys.publicKey);
      await _saveMaster(keys.publicKey, avatar);
    } catch (_) {
      _logger.error(runtimeType, 'Failed to create new wallet');
    }
  }

  @override
  Future<void> importMasterFromMnemonic(String mnemonic) async {
    try {
      final keys = await ChainWalletManager.instance
          .importMasterWalletFromMnemonic(mnemonic: mnemonic);
      await _refresh();
      final avatar = _generateAvatar(keys.publicKey);
      await _saveMaster(keys.publicKey, avatar);
    } catch (_) {
      _logger.error(runtimeType, 'Failed to import wallet with mnemonic');
    }
  }

  @override
  Future<void> savePasscode(String value) async {
    await storage.write(key: _lockPinKey, value: value);
  }

  Future<void> _refresh() async {
    _mnemonic = await provider.getMnemonic();
    _publicKey = await provider.getAddress();
  }

  Future<void> _saveMaster(String address, String avatar) async {
    await _dataService.addItemToWalletList(
      _dataService.walletLength,
      'Account ${_dataService.walletLength + 1}',
      address,
      AccountType.master,
      avatar,
    );
  }

  String _generateAvatar(String seed) {
    final avatar = DiceBearBuilder(
      seed: seed,
      sprite: DiceBearSprite.bottts,
    ).build();
    return avatar.svgUri.toString();
  }
}
