import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/form/account_button.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/form/address_form_field.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const EdgeInsetsGeometry kPadding = EdgeInsets.symmetric(
  horizontal: 16,
  vertical: 5,
);

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm>
    with TickerProviderStateMixin {
  final TextEditingController addressController = TextEditingController();
  late AnimationController controller;

  String _address = '';

  @override
  void initState() {
    super.initState();
    addressController.addListener(_addressChanged);
    controller = BottomSheet.createAnimationController(this);
    controller
      ..duration = const Duration(milliseconds: 400)
      ..reverseDuration = const Duration(milliseconds: 300);
  }

  @override
  void dispose() {
    addressController
      ..removeListener(_addressChanged)
      ..dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        _Bar(
          title: s.from,
          child: AccountButton(controller: controller),
        ),
        BlocConsumer<SendCubit, SendState>(
          listener: (_, state) {
            if (state.address != _address) {
              setState(() {
                _address = state.address;
              });
            }
          },
          builder: (_, state) => _Bar(
            title: s.to,
            child: AddressFormField(
              textEditingController: addressController,
              hintText: s.addressHint,
              readOnly: state.isAddressValid,
              suffix: state.isAddressDirty
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        if (state.isAddressValid) const _Checked(),
                        InkWell(
                          onTap: addressController.clear,
                          child: const Icon(Icons.close_rounded),
                        ),
                        const SizedBox(width: 10),
                      ],
                    )
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  void _addressChanged() {
    if (_address == addressController.text) {
      return;
    }
    context.read<SendCubit>().addressChanged(addressController.text);
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kPadding,
      child: Row(
        children: [
          Expanded(
            flex: 15,
            child: Text(
              '$title:',
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 80,
            child: child,
          ),
        ],
      ),
    );
  }
}

class _Checked extends StatelessWidget {
  const _Checked();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(right: 5),
      child: Icon(Icons.check_circle, color: AppColors.success),
    );
  }
}
