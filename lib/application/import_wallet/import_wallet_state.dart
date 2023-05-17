part of 'import_wallet_bloc.dart';

@freezed
class ImportWalletState with _$ImportWalletState {
  const factory ImportWalletState.loaded({
    @Default('') String pin,
    @Default('') String confirmPin,
    @Default('') String seedPhrase,
    @Default(false) bool isPinValid,
    @Default(false) bool isPinDirty,
    @Default(false) bool isConfirmPinValid,
    @Default(false) bool isConfirmPinDirty,
    @Default(false) bool isPhraseValid,
    @Default(false) bool isPhraseDirty,
    @Default(false) bool loading,
  }) = _LoadedState;
}
