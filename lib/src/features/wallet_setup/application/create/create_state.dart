part of 'create_cubit.dart';

class CreateState extends Equatable {
  const CreateState({
    required this.key,
    required this.seedPhrase,
    required this.randomSeedPhrase,
    required this.modifiablePhrase,
    required this.paddedRandomPhrase,
    required this.checkedPhrase,
    required this.selectedPadded,
    required this.selectedRandom,
    required this.loading,
  });

  const CreateState.init()
      : key = 0,
        seedPhrase = const <Phrase>[],
        randomSeedPhrase = const <Phrase>[],
        modifiablePhrase = const <Phrase>[],
        paddedRandomPhrase = const <Phrase>[],
        checkedPhrase = const <Phrase>[],
        selectedPadded = const <Phrase>[],
        selectedRandom = null,
        loading = false;

  CreateState copyWith({
    int? key,
    List<Phrase>? seedPhrase,
    List<Phrase>? randomSeedPhrase,
    List<Phrase>? modifiablePhrase,
    List<Phrase>? paddedRandomPhrase,
    List<Phrase>? checkedPhrase,
    List<Phrase>? selectedPadded,
    Phrase? selectedRandom,
    bool? loading,
  }) {
    return CreateState(
      key: key ?? this.key,
      seedPhrase: seedPhrase ?? this.seedPhrase,
      randomSeedPhrase: randomSeedPhrase ?? this.randomSeedPhrase,
      modifiablePhrase: modifiablePhrase ?? this.modifiablePhrase,
      paddedRandomPhrase: paddedRandomPhrase ?? this.paddedRandomPhrase,
      checkedPhrase: checkedPhrase ?? this.checkedPhrase,
      selectedPadded: selectedPadded ?? this.selectedPadded,
      selectedRandom: selectedRandom ?? this.selectedRandom,
      loading: loading ?? this.loading,
    );
  }

  final int key;
  final List<Phrase> seedPhrase;
  final List<Phrase> randomSeedPhrase;
  final List<Phrase> modifiablePhrase;
  final List<Phrase> paddedRandomPhrase;
  final List<Phrase> checkedPhrase;
  final List<Phrase> selectedPadded;
  final Phrase? selectedRandom;
  final bool loading;

  @override
  List<Object?> get props => <Object?>[
    key,
    seedPhrase,
    randomSeedPhrase,
    modifiablePhrase,
    paddedRandomPhrase,
    checkedPhrase,
    selectedPadded,
    selectedRandom,
    loading,
  ];
}
