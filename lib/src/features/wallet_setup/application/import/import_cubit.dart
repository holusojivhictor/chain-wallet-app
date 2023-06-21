import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'import_state.dart';

class ImportCubit extends Cubit<ImportState> with BlocPresentationMixin {
  ImportCubit(
    this._walletService,
    this._authService,
  ) : super(const ImportState.init());

  final WalletService _walletService;
  final AuthService _authService;

  static int get minPinLength => 4;

  static List<int> get acceptableLengths => [12, 15, 18, 21, 24];

  bool _isPinValid(String value) => value.length == minPinLength;

  bool _isConfirmPinValid(String value) => value == state.pin;

  bool _isPhraseValid(String value) =>
      acceptableLengths.contains(value.split(' ').length);

  void pinChanged(String newValue) {
    emit(
      state.copyWith(
        pin: newValue,
        isPinValid: _isPinValid(newValue),
        isPinDirty: true,
      ),
    );
  }

  void confirmPinChanged(String newValue) {
    emit(
      state.copyWith(
        confirmPin: newValue,
        isConfirmPinValid: _isConfirmPinValid(newValue),
        isConfirmPinDirty: true,
      ),
    );
  }

  void phraseChanged(String newValue) {
    emit(
      state.copyWith(
        seedPhrase: newValue,
        isPhraseValid: _isPhraseValid(newValue),
        isPhraseDirty: true,
      ),
    );
  }

  Future<void> import() async {
    emit(state.copyWith(loading: true));
    if (!state.isPhraseValid) {
      emit(state.copyWith(loading: false));
      return emitPresentation(const IncompletePhrase());
    }

    await _authService.savePasscode(state.pin);

    await _walletService
        .importMasterFromMnemonic(state.seedPhrase)
        .then((value) {
      emit(state.copyWith(loading: false));
      emitPresentation(const ImportSuccess());
    });
  }
}

class IncompletePhrase implements BlocPresentationEvent {
  const IncompletePhrase();
}

class ImportSuccess implements BlocPresentationEvent {
  const ImportSuccess();
}
