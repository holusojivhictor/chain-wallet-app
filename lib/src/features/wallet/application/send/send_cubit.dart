import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_state.dart';

class SendCubit extends Cubit<SendState> {
  SendCubit(this._preferenceService) : super(const SendState.init()) {
    init();
  }

  final PreferenceService _preferenceService;

  static int get addressLength => 42;

  bool _isAddressValid(String value) =>
      value.startsWith('0x') && value.length == addressLength;

  void init() {
    final preferences = _preferenceService.preferences;
    emit(state.copyWith(type: preferences.chain));
  }

  void addressChanged(String newValue) {
    emit(
      state.copyWith(
        address: newValue,
        isAddressValid: _isAddressValid(newValue),
        isAddressDirty: newValue.isNotEmpty,
      ),
    );
  }

  void reset() {
    emit(state.copyWithReset());
  }
}
