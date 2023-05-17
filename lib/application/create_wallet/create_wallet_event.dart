part of 'create_wallet_bloc.dart';

@freezed
class CreateWalletEvent with _$CreateWalletEvent {
  const factory CreateWalletEvent.init() = _Init;

  const factory CreateWalletEvent.create({
    required String pin,
  }) = _Create;

  const factory CreateWalletEvent.selectedRandomChanged({
    required PhraseData value,
  }) = _SelectedRandomChanged;

  const factory CreateWalletEvent.selectedPaddedChanged({
    required PhraseData value,
  }) = _SelectedPaddedChanged;

  const factory CreateWalletEvent.confirmPhrase() = _ConfirmPhrase;
}

class EmptyPhaseInput implements BlocPresentationEvent {
  const EmptyPhaseInput();
}

class WrongPhraseOrder implements BlocPresentationEvent {
  const WrongPhraseOrder();
}

class ConfirmPhraseSuccess implements BlocPresentationEvent {
  const ConfirmPhraseSuccess();
}
