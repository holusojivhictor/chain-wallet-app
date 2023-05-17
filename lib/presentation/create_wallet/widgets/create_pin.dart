import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/create_wallet/widgets/header_column.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/presentation/shared/forms/form_field_with_header.dart';
import 'package:chain_wallet_mobile/presentation/shared/list_tiles/settings_switch_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePinView extends StatefulWidget {
  const CreatePinView({Key? key}) : super(key: key);

  @override
  State<CreatePinView> createState() => _CreatePinViewState();
}

class _CreatePinViewState extends State<CreatePinView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  bool obscurePin = true;
  bool submitted = false;

  String? pinErrorText;
  String? confirmPinErrorText;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: HeaderColumn(
            title: s.createPin,
            subtitle: s.createPinDesc,
          ),
        ),
        Expanded(
          flex: 85,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FormFieldWithHeader(
                  controller: pinController,
                  textInputType: TextInputType.number,
                  headerText: s.newPinHeader,
                  hintText: s.newPinHint,
                  autoValidate: submitted,
                  obscure: obscurePin,
                  maxLength: 4,
                  hasTrailing: false,
                  trailing: GestureDetector(
                    onTap: () => setState(() => obscurePin = !obscurePin),
                    child: Text(
                      obscurePin ? s.show : s.hide,
                      style: textTheme.bodyLarge!.copyWith(fontSize: 15),
                    ),
                  ),
                  errorText: pinErrorText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return s.pinNullError;
                    } else if (value.length < 4) {
                      return s.pinShortError;
                    }
                    return null;
                  },
                ),
                FormFieldWithHeader(
                  controller: confirmPinController,
                  textInputType: TextInputType.number,
                  headerText: s.confirmPinHeader,
                  hintText: s.confirmPinHint,
                  autoValidate: submitted,
                  obscure: obscurePin,
                  maxLength: 4,
                  hasTrailing: false,
                  errorText: confirmPinErrorText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return s.pinNullError;
                    } else if (value != pinController.text) {
                      return s.pinMatchError;
                    }
                    return null;
                  },
                ),
                BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (ctx, state) => state.map(
                    loading: (_) => const CupertinoActivityIndicator(),
                    loaded: (state) => SettingsSwitchListTile(
                      title: s.biometricsUnlock,
                      value: state.unlockWithBiometrics,
                      onChanged: (v) => context.read<SettingsBloc>().add(SettingsEvent.unlockWithBiometricsChanged(newValue: v)),
                    ),
                  ),
                ),
                BlocBuilder<CreateWalletBloc, CreateWalletState>(
                  builder: (ctx, state) => PrimaryButton(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                    text: s.createPinButton,
                    hasLoading: state.loading,
                    onPressed: () => _createWallet(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _createWallet(BuildContext context) async {
    setState(() => submitted = true);
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      context.read<CreateWalletBloc>().add(CreateWalletEvent.create(pin: pinController.text));
    }
  }
}
