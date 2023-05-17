part of 'wallets_bloc.dart';

@freezed
class WalletsState with _$WalletsState {
  const factory WalletsState.loading() = _LoadingState;

  const factory WalletsState.loaded({
    required List<WalletAccountModel> wallets,
  }) = _LoadedState;
}
