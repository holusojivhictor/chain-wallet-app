import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

const EdgeInsets _kPadding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 10,
);

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SendCubit, SendState>(
      buildWhen: (_, __) => false,
      builder: (_, state) {
        String display;
        final native = state.fieldCurrency == FieldCurrency.native;
        final amount = native ? state.amount : state.altAmount;
        if (double.parse(amount).compareTo(0.00001).isNegative) {
          display = '< 0.00001';
        } else {
          display = amount.truncate(digits: 5);
        }
        return Padding(
          padding: _kPadding,
          child: Column(
            children: [
              Text(
                s.amount.toUpperCase(),
                style: textTheme.bodySmall!.copyWith(fontSize: 14),
              ),
              const SizedBox(height: 10),
              Text(
                '$display ${state.type.currency}',
                style: textTheme.titleLarge!.copyWith(
                  fontSize: 35,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
