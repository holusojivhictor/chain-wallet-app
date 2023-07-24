part of 'send_cubit.dart';

enum FieldCurrency {
  native,
  fiat;
}

enum SendStatus {
  idle,
  loading,
  success,
  failed;
}

class SendState extends Equatable {
  const SendState({
    required this.type,
    required this.address,
    required this.amount,
    required this.altAmount,
    required this.avatar,
    required this.status,
    required this.fieldCurrency,
    required this.isAddressValid,
    required this.isAddressDirty,
    required this.isAmountValid,
    required this.isAmountDirty,
    required this.currencyChanged,
  });

  const SendState.init()
      : type = ChainType.goerli,
        address = '',
        amount = '',
        altAmount = '',
        avatar = '',
        status = SendStatus.idle,
        fieldCurrency = FieldCurrency.native,
        isAmountValid = false,
        isAmountDirty = false,
        isAddressValid = false,
        isAddressDirty = false,
        currencyChanged = false;

  final ChainType type;
  final String address;
  final String amount;
  final String altAmount;
  final String avatar;
  final SendStatus status;
  final FieldCurrency fieldCurrency;
  final bool isAddressValid;
  final bool isAddressDirty;
  final bool isAmountValid;
  final bool isAmountDirty;
  final bool currencyChanged;

  SendState copyWith({
    ChainType? type,
    String? address,
    String? amount,
    String? altAmount,
    String? avatar,
    SendStatus? status,
    FieldCurrency? fieldCurrency,
    bool? isAddressValid,
    bool? isAddressDirty,
    bool? isAmountValid,
    bool? isAmountDirty,
    bool? currencyChanged,
  }) {
    return SendState(
      type: type ?? this.type,
      address: address ?? this.address,
      amount: amount ?? this.amount,
      altAmount: altAmount ?? this.altAmount,
      avatar: avatar ?? this.avatar,
      status: status ?? this.status,
      fieldCurrency: fieldCurrency ?? this.fieldCurrency,
      isAddressValid: isAddressValid ?? this.isAddressValid,
      isAddressDirty: isAddressDirty ?? this.isAddressDirty,
      isAmountValid: isAmountValid ?? this.isAmountValid,
      isAmountDirty: isAmountDirty ?? this.isAmountDirty,
      currencyChanged: currencyChanged ?? this.currencyChanged,
    );
  }

  SendState copyWithReset() {
    return copyWith(
      address: '',
      amount: '',
      altAmount: '',
      avatar: '',
      status: SendStatus.idle,
      fieldCurrency: FieldCurrency.native,
      isAddressValid: false,
      isAddressDirty: false,
      isAmountValid: false,
      isAmountDirty: false,
      currencyChanged: false,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    type,
    address,
    amount,
    altAmount,
    avatar,
    status,
    fieldCurrency,
    isAddressValid,
    isAddressDirty,
    isAmountValid,
    isAmountDirty,
    currencyChanged,
  ];
}
