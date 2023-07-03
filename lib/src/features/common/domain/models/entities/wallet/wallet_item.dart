import 'package:hive/hive.dart';

part 'wallet_item.g.dart';

@HiveType(typeId: 0)
class WalletItem extends HiveObject {
  WalletItem(
    this.itemKey,
    this.name,
    this.address,
    this.type,
    this.avatar,
  );

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
