import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/forms/form_field_with_header.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/import/import_cubit.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/widgets/preference_switch_tile.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImportForm extends StatefulWidget {
  const ImportForm({super.key});

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
    seedPhraseController.removeListener(_seedPhraseChanged);
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
        BlocConsumer<ImportCubit, ImportState>(
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
            maxLength: ImportCubit.pinLength,
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
        BlocConsumer<ImportCubit, ImportState>(
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
            maxLength: ImportCubit.pinLength,
            hasTrailing: false,
            suffixIcon: state.isConfirmPinValid ? const _CheckIcon() : null,
            errorText: !state.isConfirmPinValid && state.isConfirmPinDirty ? s.pinMatchError : null,
          ),
        ),
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (ctx, state) => PreferenceSwitchTile(
            title: s.biometricsUnlock,
            value: state.unlockWithBiometrics,
            onChanged: (v) {
              context.read<SettingsBloc>().add(SettingsEvent.unlockWithBiometricsChanged(newValue: v));
            },
          ),
        ),
        BlocBuilder<ImportCubit, ImportState>(
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
    context.read<ImportCubit>().pinChanged(pinController.text);
  }

  void _confirmPinChanged() {
    if (_confirmPin == confirmPinController.text) {
      return;
    }
    _confirmPin = confirmPinController.text;
    context.read<ImportCubit>().confirmPinChanged(confirmPinController.text);
  }

  void _seedPhraseChanged() {
    context.read<ImportCubit>().phraseChanged(seedPhraseController.text);
  }

  void _import() {
    context.read<ImportCubit>().import();
  }
}

class _CheckIcon extends StatelessWidget {
  const _CheckIcon();

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.check, size: 16, color: AppColors.success);
  }
}
