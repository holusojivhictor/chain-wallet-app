part of 'import_cubit.dart';

class ImportState extends Equatable {
  const ImportState({
    required this.pin,
    required this.confirmPin,
    required this.seedPhrase,
    required this.isPinValid,
    required this.isPinDirty,
    required this.isConfirmPinValid,
    required this.isConfirmPinDirty,
    required this.isPhraseValid,
    required this.isPhraseDirty,
    required this.loading,
  });

  const ImportState.init()
      : pin = '',
        confirmPin = '',
        seedPhrase = '',
        isPinValid = false,
        isPinDirty = false,
        isConfirmPinValid = false,
        isConfirmPinDirty = false,
        isPhraseValid = false,
        isPhraseDirty = false,
        loading = false;

  ImportState copyWith({
    String? pin,
    String? confirmPin,
    String? seedPhrase,
    bool? isPinValid,
    bool? isPinDirty,
    bool? isConfirmPinValid,
    bool? isConfirmPinDirty,
    bool? isPhraseValid,
    bool? isPhraseDirty,
    bool? loading,
  }) {
    return ImportState(
      pin: pin ?? this.pin,
      confirmPin: confirmPin ?? this.confirmPin,
      seedPhrase: seedPhrase ?? this.seedPhrase,
      isPinValid: isPinValid ?? this.isPinValid,
      isPinDirty: isPinDirty ?? this.isPinDirty,
      isConfirmPinValid: isConfirmPinValid ?? this.isConfirmPinValid,
      isConfirmPinDirty: isConfirmPinDirty ?? this.isConfirmPinDirty,
      isPhraseValid: isPhraseValid ?? this.isPhraseValid,
      isPhraseDirty: isPhraseDirty ?? this.isPhraseDirty,
      loading: loading ?? this.loading,
    );
  }

  final String pin;
  final String confirmPin;
  final String seedPhrase;
  final bool isPinValid;
  final bool isPinDirty;
  final bool isConfirmPinValid;
  final bool isConfirmPinDirty;
  final bool isPhraseValid;
  final bool isPhraseDirty;
  final bool loading;

  @override
  List<Object?> get props => <Object?>[
    pin,
    confirmPin,
    seedPhrase,
    isPinValid,
    isPinDirty,
    isConfirmPinValid,
    isConfirmPinDirty,
    isPhraseValid,
    isPhraseDirty,
    loading,
  ];
}
