import 'package:chain_wallet/chain_wallet.dart';
import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/domain/services/secrets/secrets.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:dice_bear/dice_bear.dart';
import 'package:web3dart/credentials.dart';

class WalletServiceImpl implements WalletService {
  final LoggingService _logger;
  final DataService _dataService;

  late String _mnemonic;
  late String _privateKey;

  WalletServiceImpl(this._logger, this._dataService);

  final storage = ChainWalletManager.instance.storageProvider;

  @override
  String get mnemonic => _mnemonic;

  @override
  String get privateKey => _privateKey;

  @override
  Future<void> init() async {
    final config = ChainWalletClientConfig(
      rpcUrl: Secrets.rpcUrl,
      wsUrl: Secrets.wsUrl,
      contractAddress: EthereumAddress.fromHex(Secrets.contractAddress),
      nftStorageApiKey: Secrets.nftStorageApiKey,
    );

    await ChainWalletManager.instance.init(config);
    await _refresh();
  }

  @override
  Future<void> createMaster() async {
    try {
      final keys = await ChainWalletManager.instance.createMasterWallet();
      await _refresh();
      final avatar = _generateAvatar(keys.publicKey);
      await _saveMaster(keys.publicKey, avatar);
    } catch (_) {
      _logger.error(runtimeType, "Failed to create new wallet");
    }
  }

  @override
  Future<void> importMasterFromMnemonic(String mnemonic) async {
    try {
      final keys = await ChainWalletManager.instance.importMasterWalletFromMnemonic(mnemonic: mnemonic);
      await _refresh();
      final avatar = _generateAvatar(keys.publicKey);
      await _saveMaster(keys.publicKey, avatar);
    } catch (_) {
      _logger.error(runtimeType, "Failed to import wallet with mnemonic");
    }
  }

  Future<void> _refresh() async {
    _mnemonic = await storage.getMnemonic();
    _privateKey = await storage.getPrivateKey();
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
