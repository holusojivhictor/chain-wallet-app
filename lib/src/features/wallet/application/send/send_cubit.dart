import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'send_state.dart';

class SendCubit extends Cubit<SendState> {
  SendCubit(
    this._preferenceService,
    this._dataService,
  ) : super(const SendState.init()) {
    init();
  }

  final PreferenceService _preferenceService;
  final DataService _dataService;

  static final RegExp amountValidator = RegExp(r'^\d*\.?\d+$');

  bool _isAddressValid(String hex) => CryptoUtils.isValidAddress(hex);

  bool _isAmountValid(String value) => amountValidator.hasMatch(value);

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
        currencyChanged: false,
      ),
    );
  }

  void amountChanged(String newValue) {
    emit(
      state.copyWith(
        amount: newValue,
        isAmountValid: _isAmountValid(newValue),
        isAmountDirty: newValue.isNotEmpty,
        currencyChanged: false,
      ),
    );
  }

  void altAmountChanged(String newValue) {
    emit(
      state.copyWith(
        altAmount: newValue,
        currencyChanged: false,
      ),
    );
  }

  void currencyChanged() {
    FieldCurrency newValue;
    switch (state.fieldCurrency) {
      case FieldCurrency.native:
        newValue = FieldCurrency.fiat;
      case FieldCurrency.fiat:
        newValue = FieldCurrency.native;
    }

    emit(
      state.copyWith(
        fieldCurrency: newValue,
        currencyChanged: true,
      ),
    );
  }

  void updateAvatar() {
    final list = _dataService.getRecents();
    final recent = list.firstWhere((el) => el.address == state.address);
    emit(state.copyWith(avatar: recent.avatar));
  }

  Future<void> saveAddress() async {
    final saved = _dataService.isItemInRecentList(state.address);
    if (!saved) {
      await _dataService.saveRecent(state.address);
    }
  }

  void reset() {
    emit(state.copyWithReset());
  }
}
