import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/amount/widgets/amount_form.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/error/error_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/page_wrapper.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AmountPage extends StatefulWidget {
  const AmountPage({super.key});

  @override
  State<AmountPage> createState() => _AmountPageState();
}

class _AmountPageState extends State<AmountPage> {
  double opacity = 0;
  String error = '';

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocConsumer<SendCubit, SendState>(
      listener: (ctx, state) {
        if (state.isAmountValid) {
          setState(() => opacity = 0);
        }
      },
      builder: (ctx, state) {
        return BlocBuilder<WalletBloc, WalletState>(
          buildWhen: (_, __) => false,
          builder: (_, walletState) => PageWrapper(
            title: s.amount,
            type: state.type,
            enabled: true,
            buttonText: s.next,
            onPressed: () {
              if (!state.isAmountValid) {
                setState(() {
                  error = s.invalidAmount;
                  opacity = 1;
                });
                return;
              }
              final balance = walletState.activeWallet.walletBalance;
              final native = state.fieldCurrency == FieldCurrency.native;
              final amount = native ? state.amount : state.altAmount;
              if (double.parse(amount) > balance) {
                setState(() {
                  error = s.insufficientFunds;
                  opacity = 1;
                });
                return;
              }

              context.read<SendCubit>().updateAvatar();
              context.go(AppRoute.confirm.path);
            },
            body: Column(
              children: [
                const AmountForm(),
                const SizedBox(height: 10),
                AnimatedOpacity(
                  opacity: opacity,
                  duration: const Duration(milliseconds: 200),
                  child: ErrorBar(
                    errorText: error,
                    level: Level.error,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
