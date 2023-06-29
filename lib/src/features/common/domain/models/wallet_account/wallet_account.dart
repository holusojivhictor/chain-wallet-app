import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_account.freezed.dart';

@freezed
class WalletAccount with _$WalletAccount {
  factory WalletAccount.local({
    required int key,
    required String accountName,
    required String accountAddress,
    required AccountType type,
    required String avatar,
  }) = _Local;
}
