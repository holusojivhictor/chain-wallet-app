import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:hive_flutter/adapters.dart';
import 'package:synchronized/synchronized.dart';

class DataServiceImpl implements DataService {
  late Box<WalletAccountItem> _walletAccountsBox;

  final _initLock = Lock();
  final _deleteAllLock = Lock();

  @override
  Future<void> init({String dir = 'chain_wallet_data'}) async {
    await _initLock.synchronized(() async {
      await Hive.initFlutter(dir);
      _registerAdapters();
      _walletAccountsBox =
          await Hive.openBox<WalletAccountItem>('walletAccountItems');
    });
  }

  @override
  Future<void> deleteAll() async {
    await _deleteAllLock.synchronized(() async {
      await _walletAccountsBox.clear();
    });
  }

  @override
  Future<void> closeAll() async {
    await _deleteAllLock.synchronized(() async {
      await Hive.close();
    });
  }

  @override
  int get walletLength => _walletAccountsBox.length;

  @override
  List<WalletAccount> getWalletAccounts() {
    final values = _walletAccountsBox.values.toList()
      ..sort((x, y) => x.itemKey.compareTo(y.itemKey));

    return values.map((e) {
      return WalletAccount.local(
        key: e.itemKey,
        accountName: e.name,
        accountAddress: e.address,
        type: AccountType.values.elementAt(e.type),
        avatar: e.avatar,
      );
    }).toList();
  }

  @override
  Future<void> addItemToWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  ) async {
    if (isItemInWalletList(key, type)) {
      return Future.value();
    }
    await _walletAccountsBox.add(WalletAccountItem(key, name, address, type.index, avatar));
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
      item = WalletAccountItem(key, name, address, type.index, avatar);
      await _walletAccountsBox.add(item);
    } else {
      await item.save();
    }
  }

  @override
  Future<void> deleteWalletList() async {
    final walletItemKeys = _walletAccountsBox.values.map((e) => e.key).toList();
    if (walletItemKeys.isNotEmpty) {
      await _walletAccountsBox.deleteAll(walletItemKeys);
    }
  }

  @override
  bool isItemInWalletList(int key, AccountType type) {
    return _walletAccountsBox.values.any((el) => el.itemKey == key && el.type == type.index);
  }

  WalletAccountItem? _getItemFromWalletList(int key) {
    return _walletAccountsBox.values.firstWhereOrNull((el) => el.itemKey == key);
  }

  void _registerAdapters() {
    Hive.registerAdapter(WalletAccountItemAdapter());
  }
}
