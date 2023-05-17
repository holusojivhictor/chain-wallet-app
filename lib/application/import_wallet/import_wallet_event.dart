part of 'import_wallet_bloc.dart';

@freezed
class ImportWalletEvent with _$ImportWalletEvent {
  const factory ImportWalletEvent.pinChanged({
    required String newValue,
  }) = _PinChanged;

  const factory ImportWalletEvent.confirmPinChanged({
    required String newValue,
  }) = _ConfirmPinChanged;

  const factory ImportWalletEvent.phraseChanged({
    required String newValue,
  }) = _PhraseChanged;

  const factory ImportWalletEvent.import() = _Import;
}

class IncompletePhrase implements BlocPresentationEvent {
  const IncompletePhrase();
}
