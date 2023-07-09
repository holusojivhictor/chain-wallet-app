import 'package:hive/hive.dart';

part 'recent_item.g.dart';

@HiveType(typeId: 2)
class RecentItem extends HiveObject {
  RecentItem(
    this.itemKey,
    this.address,
    this.avatar,
  );

  @HiveField(0)
  final int itemKey;

  @HiveField(1)
  final String address;

  @HiveField(2)
  final String avatar;
}
