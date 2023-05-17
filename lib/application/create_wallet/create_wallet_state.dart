part of 'create_wallet_bloc.dart';

@freezed
class CreateWalletState with _$CreateWalletState {
  const factory CreateWalletState.loaded({
    @Default(0) int key,
    @Default([]) List<PhraseData> seedPhrase,
    @Default([]) List<PhraseData> randomSeedPhrase,
    @Default([]) List<PhraseData> modifiablePhrase,
    @Default([]) List<PhraseData> paddedRandomPhrase,
    @Default([]) List<PhraseData> checkedPhrase,
    @Default([]) List<PhraseData> selectedPadded,
    PhraseData? selectedRandom,
    @Default(false) bool loading,
  }) = _LoadedState;
}
