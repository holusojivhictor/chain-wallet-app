import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/extensions/string_extensions.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_wallet_bloc.freezed.dart';
part 'create_wallet_event.dart';
part 'create_wallet_state.dart';

const _initialState = CreateWalletState.loaded();

class CreateWalletBloc extends Bloc<CreateWalletEvent, CreateWalletState> with BlocPresentationMixin {
  final WalletService _walletService;
  final ChainWalletAppService _appService;
  final PageViewBloc _pageBloc;

  CreateWalletBloc(this._walletService, this._appService, this._pageBloc) : super(_initialState) {
    on<_Init>(_mapInitToState);
    on<_Create>(_mapCreateToState);
    on<_SelectedPaddedChanged>(_mapSelectedPaddedChangedToState);
    on<_SelectedRandomChanged>(_mapSelectedRandomChangedToState);
    on<_ConfirmPhrase>(_mapConfirmPhraseToState);
  }

  // ignore: library_private_types_in_public_api
  _LoadedState get currentState => state as _LoadedState;

  List<PhraseData> get fullData => _appService.getPhraseData();

  CreateWalletState _buildBaseState({
    int key = 0,
    List<PhraseData> random = const [],
    List<PhraseData> selectedData = const [],
    List<PhraseData> checkedPhrase = const [],
  }) {
    final paddedRandom = (random + fullData.where((el) => random.firstWhereOrNull((e) => e.position == el.position) == null).sample(2))..shuffle();
    final modifiable = random.map((e) => PhraseData(position: e.position)).toList();

    final s = currentState.copyWith.call(
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

  List<PhraseData> _generateRandomSeed({List<PhraseData> checkedPhrase = const []}) {
    return fullData.where((el) => checkedPhrase.firstWhereOrNull((e) => e.position == el.position) == null).sample(3);
  }

  void _mapCreateToState(_Create event, Emitter<CreateWalletState> emit) async {
    emit(currentState.copyWith.call(loading: true));
    await _appService.savePasscode(event.pin);

    await _walletService.createMaster().then((value) {
      add(const CreateWalletEvent.init());
      emit(state.copyWith.call(loading: false));
    });

    _pageBloc.add(const PageViewEvent.next());
  }

  void _mapInitToState(_Init event, Emitter<CreateWalletState> emit) async {
    final randomSeed = _generateRandomSeed();
    emit(_buildBaseState(random: randomSeed));
  }

  void _mapSelectedPaddedChangedToState(_SelectedPaddedChanged event, Emitter<CreateWalletState> emit) {
    var data = <PhraseData>[];
    var newRandom = <PhraseData>[];
    PhraseData selectedRandom;

    if (currentState.selectedPadded.contains(event.value)) {
      final selected = currentState.modifiablePhrase.firstWhere((el) => el.value == event.value.value);
      final index = currentState.modifiablePhrase.indexOf(selected);

      newRandom = modifiableRandom(data: selected, newValue:  '', position: index);
      data = currentState.selectedPadded.toList()..removeWhere((v) => v == event.value);
      selectedRandom = newRandom.elementAt(index);
    } else {
      if (currentState.selectedPadded.length == 3) {
        return;
      }
      final selected = currentState.selectedRandom;
      final index = currentState.modifiablePhrase.indexOf(selected!);

      if (selected.value.isNotNullEmptyOrWhitespace) {
        data = (currentState.selectedPadded.toList()..removeWhere((el) => el.value == selected.value)) + [event.value];
      } else {
        data = currentState.selectedPadded + [event.value];
      }

      newRandom = modifiableRandom(
        data: selected,
        newValue: event.value.value,
        position: index,
      );

      selectedRandom = index + 1 < newRandom.length ? newRandom.elementAt(index + 1) : newRandom.elementAt(index);
    }

    final state = currentState.copyWith.call(
      selectedPadded: data,
      modifiablePhrase: newRandom,
      selectedRandom: selectedRandom,
    );
    emit(state);
  }

  void _mapSelectedRandomChangedToState(_SelectedRandomChanged event, Emitter<CreateWalletState> emit) {
    _LoadedState state;

    final hasValueText = event.value.value.isNotNullEmptyOrWhitespace;

    if (hasValueText) {
      final index = currentState.modifiablePhrase.indexOf(event.value);
      final padded = currentState.selectedPadded.toList()
        ..removeWhere((el) => el.value == event.value.value);

      final newRandom = modifiableRandom(
        data: event.value,
        newValue:  '',
        position: index,
      );

      state = currentState.copyWith.call(
        modifiablePhrase: newRandom,
        selectedPadded: padded,
        selectedRandom: newRandom.elementAt(index),
      );
    } else {
      state = currentState.copyWith.call(
        selectedRandom: event.value,
      );
    }

    emit(state);
  }

  List<PhraseData> modifiableRandom({
    required PhraseData data,
    required String newValue,
    required int position,
  }) {
    final random = currentState.modifiablePhrase.toList();

    final modified = random
      ..removeAt(position)
      ..insert(position, data..changeValue(newValue));
    return modified;
  }

  void _mapConfirmPhraseToState(_ConfirmPhrase event, Emitter<CreateWalletState> emit) {
    final modifiable = currentState.modifiablePhrase;
    final currentRandom = currentState.randomSeedPhrase;

    if (modifiable.any((el) => el.value.isNullEmptyOrWhitespace)) {
      return emitPresentation(const EmptyPhaseInput());
    }

    if (!modifiable.every((el) => el.value == currentRandom.firstWhere((e) => e.position == el.position).value)) {
      return emitPresentation(const WrongPhraseOrder());
    }

    final checkedPhrase = currentState.checkedPhrase + currentRandom;
    final randomSeed = _generateRandomSeed(checkedPhrase: checkedPhrase);

    if (randomSeed.isEmpty) {
      _pageBloc.add(const PageViewEvent.next());
      return emitPresentation(const ConfirmPhraseSuccess());
    }

    emit(_buildBaseState(
      key: currentState.key + 1,
      random: randomSeed,
      checkedPhrase: checkedPhrase,
    ));
  }
}
