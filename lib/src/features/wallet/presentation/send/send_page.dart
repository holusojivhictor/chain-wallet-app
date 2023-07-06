import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/action_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/form/address_form.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return BlocBuilder<SendCubit, SendState>(
      builder: (ctx, state) => WillPopScope(
        onWillPop: () async => false,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: ActionAppBar(
              title: s.sendTo,
              type: state.type,
              theme: theme,
            ),
            body: Column(
              children: [
                const AddressForm(),
                const Divider(),
                if (!state.isAddressValid && state.isAddressDirty)
                  const _Error(),
              ],
            ),
            bottomSheet: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: Styles.edgeInsetAll10,
                  color: theme.scaffoldBackgroundColor,
                  child: PrimaryButton(
                    text: s.next,
                    enabled: state.isAddressValid,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 12,
      ),
      padding: Styles.edgeInsetAll10,
      decoration: BoxDecoration(
        color: const Color(0xFFFEFBEC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFEDA56B)),
      ),
      child: Row(
        children: [
          const Text('❕'),
          const SizedBox(width: 5),
          Flexible(
            child: Text(
              s.invalidAddress,
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
