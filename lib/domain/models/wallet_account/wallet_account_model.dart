import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_account_model.freezed.dart';

@freezed
class WalletAccountModel with _$WalletAccountModel {
  factory WalletAccountModel.local({
    required String accountName,
    required String accountAddress,
    required AccountType type,
    required String avatar,
  }) = _Local;
}
