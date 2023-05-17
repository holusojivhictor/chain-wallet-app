import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/shared/forms/form_field_with_header.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/presentation/shared/list_tiles/settings_switch_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportForm extends StatefulWidget {
  const ImportForm({Key? key}) : super(key: key);

  @override
  State<ImportForm> createState() => _ImportFormState();
}

class _ImportFormState extends State<ImportForm> {
  final TextEditingController seedPhraseController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController confirmPinController = TextEditingController();
  bool obscurePin = true;

  String _pin = '';
  String _confirmPin = '';

  @override
  void initState() {
    super.initState();
    seedPhraseController.addListener(_seedPhraseChanged);
    pinController.addListener(_pinChanged);
    confirmPinController.addListener(_confirmPinChanged);
  }

  @override
  void dispose() {
    seedPhraseController.addListener(_seedPhraseChanged);
    pinController.removeListener(_pinChanged);
    confirmPinController.removeListener(_confirmPinChanged);
    seedPhraseController.dispose();
    pinController.dispose();
    confirmPinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FormFieldWithHeader(
          controller: seedPhraseController,
          textInputType: TextInputType.text,
          headerText: s.secretPhraseHeader,
          hintText: s.secretPhraseHint,
          maxLines: 3,
        ),
        const SizedBox(height: 10),
        BlocConsumer<ImportWalletBloc, ImportWalletState>(
          listener: (ctx, state) {
            if (state.pin != _pin) {
              setState(() {
                _pin = state.pin;
                pinController.text = _pin;
              });
            }
          },
          builder: (ctx, state) => FormFieldWithHeader(
            controller: pinController,
            textInputType: TextInputType.number,
            headerText: s.newPinHeader,
            hintText: s.newPinHint,
            obscure: obscurePin,
            maxLength: ImportWalletBloc.minPinLength,
            hasTrailing: false,
            trailing: GestureDetector(
              onTap: () => setState(() => obscurePin = !obscurePin),
              child: Text(
                obscurePin ? s.show : s.hide,
                style: textTheme.bodyLarge!.copyWith(fontSize: 15),
              ),
            ),
            errorText: !state.isPinValid && state.isPinDirty ? s.pinShortError : null,
          ),
        ),
        BlocConsumer<ImportWalletBloc, ImportWalletState>(
          listener: (ctx, state) {
            if (state.confirmPin != _confirmPin) {
              setState(() {
                _confirmPin = state.confirmPin;
                confirmPinController.text = _confirmPin;
              });
            }
          },
          builder: (ctx, state) => FormFieldWithHeader(
            controller: confirmPinController,
            textInputType: TextInputType.number,
            headerText: s.confirmPinHeader,
            hintText: s.confirmPinHint,
            obscure: obscurePin,
            maxLength: ImportWalletBloc.minPinLength,
            hasTrailing: false,
            suffixIcon: state.isConfirmPinValid ? const Icon(Icons.check, size: 16, color: AppColors.success) : null,
            errorText: !state.isConfirmPinValid && state.isConfirmPinDirty ? s.pinMatchError : null,
          ),
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
        BlocBuilder<ImportWalletBloc, ImportWalletState>(
          builder: (ctx, state) => PrimaryButton(
            text: s.importButton,
            enabled: state.isPinValid && state.isConfirmPinValid,
            hasLoading: state.loading,
            onPressed: _import,
          ),
        )
      ],
    );
  }

  void _pinChanged() {
    if (_pin == pinController.text) {
      return;
    }
    _pin = pinController.text;
    context.read<ImportWalletBloc>().add(ImportWalletEvent.pinChanged(newValue: pinController.text));
  }

  void _confirmPinChanged() {
    if (_confirmPin == confirmPinController.text) {
      return;
    }
    _confirmPin = confirmPinController.text;
    context.read<ImportWalletBloc>().add(ImportWalletEvent.confirmPinChanged(newValue: confirmPinController.text));
  }

  void _seedPhraseChanged() {
    context.read<ImportWalletBloc>().add(ImportWalletEvent.phraseChanged(newValue: seedPhraseController.text));
  }

  void _import() {
    context.read<ImportWalletBloc>().add(const ImportWalletEvent.import());
  }
}
