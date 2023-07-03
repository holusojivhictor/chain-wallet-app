import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';

abstract class DataService {
  Future<void> init({String dir = 'chain_wallet_data'});

  Future<void> deleteAll();

  Future<void> closeAll();

  List<Wallet> getWallets();

  List<Token> getTokens();

  Future<int> saveWallet(AccountType type, String address);

  Future<int> saveToken(
    String name,
    String symbol,
    BigInt chainId,
    BigInt decimals,
  );

  Future<void> updateItemInWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  );

  Future<void> deleteWalletList();

  Future<void> deleteTokenList();

  bool isItemInWalletList(int key, AccountType type);

  bool isItemInTokenList(int key, String symbol);
}
