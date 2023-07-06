part of 'send_cubit.dart';

class SendState extends Equatable {
  const SendState({
    required this.type,
    required this.address,
    required this.isAddressValid,
    required this.isAddressDirty,
  });

  const SendState.init()
      : type = ChainType.goerli,
        address = '',
        isAddressValid = false,
        isAddressDirty = false;

  final ChainType type;
  final String address;
  final bool isAddressValid;
  final bool isAddressDirty;

  SendState copyWith({
    ChainType? type,
    String? address,
    bool? isAddressValid,
    bool? isAddressDirty,
  }) {
    return SendState(
      type: type ?? this.type,
      address: address ?? this.address,
      isAddressValid: isAddressValid ?? this.isAddressValid,
      isAddressDirty: isAddressDirty ?? this.isAddressDirty,
    );
  }

  SendState copyWithReset() {
    return copyWith(
      address: '',
      isAddressValid: false,
      isAddressDirty: false,
    );
  }

  @override
  List<Object?> get props => <Object?>[
    type,
    address,
    isAddressValid,
    isAddressDirty,
  ];
}
