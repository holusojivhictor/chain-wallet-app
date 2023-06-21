import 'package:hive/hive.dart';

part 'wallet_account_item.g.dart';

@HiveType(typeId: 0)
class WalletAccountItem extends HiveObject {
  WalletAccountItem(this.itemKey, this.name, this.address, this.type, this.avatar);

  @HiveField(0)
  final int itemKey;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String address;

  @HiveField(3)
  final int type;

  @HiveField(4)
  final String avatar;
}
