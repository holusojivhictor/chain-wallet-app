import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/chain_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyBar extends StatelessWidget {
  const CurrencyBar({
    required this.amount,
    required this.fieldCurrency,
    required this.type,
    super.key,
  });

  final double amount;
  final FieldCurrency fieldCurrency;
  final ChainType type;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (_, __) => false,
      builder: (_, walletState) {
        double value;

        switch (fieldCurrency) {
          case FieldCurrency.native:
            value = amount * walletState.latestPrice;
          case FieldCurrency.fiat:
            value = amount / walletState.latestPrice;
        }

        context.read<SendCubit>().altAmountChanged(value.toString());

        String translation;
        switch (fieldCurrency) {
          case FieldCurrency.native:
            translation = r'$' '${value.fixed(2)}';
          case FieldCurrency.fiat:
            translation = '${value.fixed(5)} ${type.currency.toUpperCase()}';
        }

        return _Bar(
          translation: translation,
        );
      },
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.translation});

  final String translation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Styles.edgeInsetAll10,
        child: InkWell(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            context.read<SendCubit>().currencyChanged();
          },
          borderRadius: Styles.chipBorderRadius,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 5,
            ),
            margin: Styles.edgeInsetAll3,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: Styles.chipBorderRadius,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(translation),
                const Icon(
                  Icons.swap_vert_rounded,
                  size: 16,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
