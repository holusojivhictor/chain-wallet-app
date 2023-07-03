import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:dice_bear/dice_bear.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:synchronized/synchronized.dart';

class DataServiceImpl implements DataService {
  late Box<WalletItem> _walletsBox;
  late Box<TokenItem> _tokensBox;

  final _initLock = Lock();
  final _deleteAllLock = Lock();

  @override
  Future<void> init({String dir = 'chain_wallet_data'}) async {
    await _initLock.synchronized(() async {
      await Hive.initFlutter(dir);
      _registerAdapters();
      _walletsBox = await Hive.openBox<WalletItem>('walletItems');
      _tokensBox = await Hive.openBox<TokenItem>('tokenItems');
    });
  }

  @override
  Future<void> deleteAll() async {
    await _deleteAllLock.synchronized(() async {
      await _walletsBox.clear();
      await _tokensBox.clear();
    });
  }

  @override
  Future<void> closeAll() async {
    await _deleteAllLock.synchronized(() async {
      await Hive.close();
    });
  }

  int get walletLength => _walletsBox.length;

  int get tokenLength => _tokensBox.length;

  @override
  List<Wallet> getWallets() {
    final values = _walletsBox.values.toList()
      ..sort((x, y) => x.itemKey.compareTo(y.itemKey));

    return values.map((e) {
      return Wallet(
        key: e.itemKey,
        name: e.name,
        address: e.address,
        type: AccountType.values.elementAt(e.type),
        avatar: e.avatar,
      );
    }).toList();
  }

  @override
  List<Token> getTokens() {
    final values = _tokensBox.values.toList()
      ..sort((x, y) => x.itemKey.compareTo(y.itemKey));

    return values.map((e) {
      return Token(
        key: e.itemKey,
        name: e.name,
        symbol: e.symbol,
        chainId: e.chainId,
        decimals: e.decimals,
      );
    }).toList();
  }

  @override
  Future<int> saveWallet(AccountType type, String address) {
    final avatar = _generateAvatar(address);
    return _addItemToWalletList(
      walletLength,
      'Account ${walletLength + 1}',
      address,
      type,
      avatar,
    );
  }

  @override
  Future<int> saveToken(
    String name,
    String symbol,
    BigInt chainId,
    BigInt decimals,
  ) {
    return _addItemToTokenList(tokenLength, name, symbol, chainId, decimals);
  }

  @override
  Future<void> updateItemInWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  ) async {
    var item = _getItemFromWalletList(key);
    if (item == null) {
      item = WalletItem(key, name, address, type.index, avatar);
      await _walletsBox.add(item);
    } else {
      await item.save();
    }
  }

  @override
  Future<void> deleteWalletList() async {
    final walletItemKeys = _walletsBox.values.map((e) => e.key).toList();
    if (walletItemKeys.isNotEmpty) {
      await _walletsBox.deleteAll(walletItemKeys);
    }
  }

  @override
  Future<void> deleteTokenList() async {
    final tokenItemKeys = _tokensBox.values.map((e) => e.key).toList();
    if (tokenItemKeys.isNotEmpty) {
      await _tokensBox.deleteAll(tokenItemKeys);
    }
  }

  @override
  bool isItemInWalletList(int key, AccountType type) {
    return _walletsBox.values
        .any((el) => el.itemKey == key && el.type == type.index);
  }

  @override
  bool isItemInTokenList(int key, String symbol) {
    return _tokensBox.values
        .any((el) => el.itemKey == key && el.symbol == symbol);
  }

  Future<int> _addItemToWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  ) {
    if (isItemInWalletList(key, type)) {
      return Future.value(key);
    }
    return _walletsBox.add(WalletItem(key, name, address, type.index, avatar));
  }

  Future<int> _addItemToTokenList(
    int key,
    String name,
    String symbol,
    BigInt chainId,
    BigInt decimals,
  ) {
    if (isItemInTokenList(key, symbol)) {
      return Future.value(key);
    }
    return _tokensBox.add(TokenItem(key, name, symbol, chainId, decimals));
  }

  WalletItem? _getItemFromWalletList(int key) {
    return _walletsBox.values.firstWhereOrNull((el) => el.itemKey == key);
  }

  void _registerAdapters() {
    Hive
      ..registerAdapter(WalletItemAdapter())
      ..registerAdapter(TokenItemAdapter());
  }

  /// Dicebear impl
  String _generateAvatar(String seed) {
    final avatar = DiceBearBuilder(
      seed: seed,
      sprite: DiceBearSprite.bottts,
    ).build();
    return avatar.svgUri.toString();
  }
}
