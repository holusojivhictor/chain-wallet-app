import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/amount/widgets/amount_form_field.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/amount/widgets/balance_row.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/amount/widgets/currency_bar.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmountForm extends StatefulWidget {
  const AmountForm({super.key});

  @override
  State<AmountForm> createState() => _AmountFormState();
}

class _AmountFormState extends State<AmountForm> {
  final TextEditingController amountController = TextEditingController();

  String _amount = '';

  @override
  void initState() {
    super.initState();
    amountController.addListener(_amountChanged);
  }

  @override
  void dispose() {
    amountController
      ..removeListener(_amountChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SendCubit, SendState>(
      listener: (ctx, state) {
        if (state.amount != _amount) {
          setState(() {
            _amount = state.amount;
          });
        }

        if (state.currencyChanged) {
          final native = state.fieldCurrency == FieldCurrency.native;
          final truncated = state.altAmount.truncate(digits: native ? 5 : 2);
          context.read<SendCubit>().amountChanged(state.altAmount);
          amountController.text = truncated;
        }
      },
      builder: (ctx, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _ChainBar(),
          Center(
            child: IntrinsicWidth(
              child: AmountFormField(
                hintText: '0',
                hasPrefix: state.fieldCurrency == FieldCurrency.fiat,
                textEditingController: amountController,
              ),
            ),
          ),
          CurrencyBar(
            amount: double.tryParse(_amount) ?? 0,
            fieldCurrency: state.fieldCurrency,
            type: state.type,
          ),
          const BalanceRow(),
        ],
      ),
    );
  }

  void _amountChanged() {
    if (_amount == amountController.text) {
      return;
    }
    context.read<SendCubit>().amountChanged(amountController.text);
  }
}

class _ChainBar extends StatelessWidget {
  const _ChainBar();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: Styles.edgeInsetAll10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              s.useMax,
              style: const TextStyle(fontSize: 13, letterSpacing: 0.1),
            ),
          ),
        ],
      ),
    );
  }
}
