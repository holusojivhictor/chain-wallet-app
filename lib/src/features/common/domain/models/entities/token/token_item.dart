import 'package:hive/hive.dart';

part 'token_item.g.dart';

@HiveType(typeId: 1)
class TokenItem extends HiveObject {
  TokenItem(
    this.itemKey,
    this.name,
    this.symbol,
    this.chainId,
    this.decimals,
  );

  @HiveField(0)
  final int itemKey;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String symbol;

  @HiveField(3)
  final BigInt chainId;

  @HiveField(4)
  final BigInt decimals;
}
