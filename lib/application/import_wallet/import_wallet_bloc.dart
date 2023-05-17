import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_wallet_bloc.freezed.dart';
part 'import_wallet_event.dart';
part 'import_wallet_state.dart';

const _initialState = ImportWalletState.loaded();

class ImportWalletBloc extends Bloc<ImportWalletEvent, ImportWalletState> with BlocPresentationMixin {
  final WalletService _walletService;
  final ChainWalletAppService _appService;
  final SessionBloc _sessionBloc;

  static int get minPinLength => 4;

  static List<int> get acceptableLengths => [12, 15, 18, 21, 24];

  ImportWalletBloc(this._walletService, this._appService, this._sessionBloc) : super(_initialState) {
    on<_PinChanged>(_mapPinChangedToState);
    on<_ConfirmPinChanged>(_mapConfirmPinChangedToState);
    on<_PhraseChanged>(_mapPhraseChangedToState);
    on<_Import>(_mapImportToState);
  }

  bool _isPinValid(String value) => value.length == minPinLength;

  bool _isConfirmPinValid(String value) => value == state.pin;

  bool _isPhraseValid(String value) => acceptableLengths.contains(value.split(' ').length);

  void _mapPinChangedToState(_PinChanged event, Emitter<ImportWalletState> emit) {
    final updatedState = state.copyWith.call(
      pin: event.newValue,
      isPinValid: _isPinValid(event.newValue),
      isPinDirty: true,
    );
    emit(updatedState);
  }

  void _mapConfirmPinChangedToState(_ConfirmPinChanged event, Emitter<ImportWalletState> emit) {
    final updatedState = state.copyWith.call(
      confirmPin: event.newValue,
      isConfirmPinValid: _isConfirmPinValid(event.newValue),
      isConfirmPinDirty: true,
    );
    emit(updatedState);
  }

  void _mapPhraseChangedToState(_PhraseChanged event, Emitter<ImportWalletState> emit) {
    final updatedState = state.copyWith.call(
      seedPhrase: event.newValue,
      isPhraseValid: _isPhraseValid(event.newValue),
      isPhraseDirty: true,
    );
    emit(updatedState);
  }

  Future<void> _mapImportToState(_Import event, Emitter<ImportWalletState> emit) async {
    emit(state.copyWith.call(loading: true));
    if (!state.isPhraseValid) {
      emit(state.copyWith.call(loading: false));
      return emitPresentation(const IncompletePhrase());
    }

    await _appService.savePasscode(state.pin);

    await _walletService.importMasterFromMnemonic(state.seedPhrase).then((value) {
      emit(state.copyWith.call(loading: false));
    });
    _sessionBloc.add(const SessionEvent.initStartup());
  }
}
