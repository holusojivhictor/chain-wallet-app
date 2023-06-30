import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'create_state.dart';

class CreateCubit extends Cubit<CreateState> with BlocPresentationMixin {
  CreateCubit(
    this._authService,
    this._pageCubit,
  ) : super(const CreateState.init());

  final AuthService _authService;
  final PageCubit _pageCubit;

  List<Phrase> get fullData => _authService.fetchPhrase();

  CreateState _buildBaseState({
    int key = 0,
    List<Phrase> random = const [],
    List<Phrase> selectedData = const [],
    List<Phrase> checkedPhrase = const [],
  }) {
    final paddedRandom =
        (random + _generateRandomSeed(checked: random, sample: 2))..shuffle();
    final modifiable = random.map((e) => Phrase(position: e.position)).toList();

    final s = state.copyWith(
      key: key,
      seedPhrase: fullData,
      randomSeedPhrase: random,
      modifiablePhrase: modifiable,
      paddedRandomPhrase: paddedRandom,
      checkedPhrase: checkedPhrase,
      selectedPadded: selectedData,
      selectedRandom: modifiable.first,
    );

    return s;
  }

  Future<void> create(String pin) async {
    emit(state.copyWith(loading: true));
    await _authService.savePasscode(pin);

    await _authService.createMaster().then((_) {
      init();
      emit(state.copyWith(loading: false));
    });

    _pageCubit.next();
  }

  void init() {
    final randomSeed = _generateRandomSeed();
    emit(_buildBaseState(random: randomSeed));
  }

  void selectedPaddedChanged(Phrase phrase) {
    var data = <Phrase>[];
    var newRandom = <Phrase>[];
    Phrase selectedRandom;

    if (state.selectedPadded.contains(phrase)) {
      final selected =
          state.modifiablePhrase.firstWhere((el) => el.value == phrase.value);
      final index = state.modifiablePhrase.indexOf(selected);

      newRandom =
          _modifiableRandom(data: selected, newValue: '', position: index);
      data = state.selectedPadded.toList()..removeWhere((v) => v == phrase);
      selectedRandom = newRandom.elementAt(index);
    } else {
      if (state.selectedPadded.length == 3) {
        return;
      }
      final selected = state.selectedRandom;
      final index = state.modifiablePhrase.indexOf(selected!);

      if (selected.value.isNotNullNorEmpty) {
        data = (state.selectedPadded.toList()
              ..removeWhere((el) => el.value == selected.value)) +
            [phrase];
      } else {
        data = state.selectedPadded + [phrase];
      }

      newRandom = _modifiableRandom(
        data: selected,
        newValue: phrase.value,
        position: index,
      );

      selectedRandom = index + 1 < newRandom.length
          ? newRandom.elementAt(index + 1)
          : newRandom.elementAt(index);
    }

    emit(
      state.copyWith(
        selectedPadded: data,
        modifiablePhrase: newRandom,
        selectedRandom: selectedRandom,
      ),
    );
  }

  void selectedRandomChanged(Phrase phrase) {
    CreateState newState;

    final hasValueText = phrase.value.isNotNullNorEmpty;

    if (hasValueText) {
      final index = state.modifiablePhrase.indexOf(phrase);
      final padded = state.selectedPadded.toList()
        ..removeWhere((el) => el.value == phrase.value);

      final newRandom = _modifiableRandom(
        data: phrase,
        newValue: '',
        position: index,
      );

      newState = state.copyWith(
        modifiablePhrase: newRandom,
        selectedPadded: padded,
        selectedRandom: newRandom.elementAt(index),
      );
    } else {
      newState = state.copyWith(
        selectedRandom: phrase,
      );
    }

    emit(newState);
  }

  void confirmPhrase() {
    final modifiable = state.modifiablePhrase;
    final currentRandom = state.randomSeedPhrase;

    if (modifiable.any((el) => el.value.isNullOrEmpty)) {
      return emitPresentation(const EmptyPhaseInput());
    }

    if (!modifiable.every(
      (el) =>
          el.value ==
          currentRandom.firstWhere((e) => e.position == el.position).value,
    )) {
      return emitPresentation(const WrongPhraseOrder());
    }

    final checkedPhrase = state.checkedPhrase + currentRandom;
    final randomSeed = _generateRandomSeed(checked: checkedPhrase);

    if (randomSeed.isEmpty) {
      _pageCubit.next();
      return emitPresentation(const ConfirmPhraseSuccess());
    }

    emit(
      _buildBaseState(
        key: state.key + 1,
        random: randomSeed,
        checkedPhrase: checkedPhrase,
      ),
    );
  }

  List<Phrase> _modifiableRandom({
    required Phrase data,
    required String newValue,
    required int position,
  }) {
    final random = state.modifiablePhrase.toList();

    final modified = random
      ..removeAt(position)
      ..insert(position, data..value = newValue);
    return modified;
  }

  List<Phrase> _generateRandomSeed({
    List<Phrase> checked = const [],
    int sample = 3,
  }) {
    return fullData.where((el) {
      return checked.firstWhereOrNull((e) => e.position == el.position) == null;
    }).sample(sample);
  }
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
