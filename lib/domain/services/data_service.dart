import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';

abstract class DataService {
  Future<void> init({String dir = 'chain_wallet_data'});

  Future<void> deleteAll();

  Future<void> closeAll();

  int get walletLength;

  List<WalletAccountModel> getWalletAccounts();

  Future<void> addItemToWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  );

  Future<void> updateItemInWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  );

  Future<void> deleteWalletList();

  bool isItemInWalletList(int key, AccountType type);
}
