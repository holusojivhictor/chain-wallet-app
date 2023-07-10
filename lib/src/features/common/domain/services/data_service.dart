import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/models.dart';

abstract class DataService {
  Future<void> init({String dir = 'chain_wallet_data'});

  Future<void> deleteAll();

  Future<void> closeAll();

  List<Wallet> getWallets();

  List<Token> getTokens();

  List<Recent> getRecents();

  Future<int> saveWallet(AccountType type, String address);

  Future<int> saveToken(
    String name,
    String symbol,
    BigInt chainId,
    BigInt decimals,
  );

  Future<int> saveRecent(String address);

  Future<void> updateItemInWalletList(
    int key,
    String name,
    String address,
    AccountType type,
    String avatar,
  );

  Future<void> deleteWalletList();

  Future<void> deleteTokenList();

  Future<void> deleteRecentList();

  bool isItemInWalletList(String address, AccountType type);

  bool isItemInTokenList(BigInt chainId);

  bool isItemInRecentList(String address);
}
