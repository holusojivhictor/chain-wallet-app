import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/account_button.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/page_wrapper.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

const EdgeInsets _kPadding = EdgeInsets.symmetric(
  horizontal: 20,
  vertical: 10,
);

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (_, __) => false,
      builder: (_, walletState) {
        final active = walletState.activeWallet.address;

        return BlocBuilder<SendCubit, SendState>(
          builder: (ctx, state) => PageWrapper(
            title: s.confirm,
            type: state.type,
            enabled: true,
            buttonText: s.send,
            onPressed: () {
              context.read<SendCubit>().send(active);
            },
            body: const Column(
              children: [
                _TopBar(),
                _BottomBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return BlocBuilder<SendCubit, SendState>(
      buildWhen: (_, __) => false,
      builder: (_, state) {
        final native = state.fieldCurrency == FieldCurrency.native;
        final amount = native ? state.amount : state.altAmount;
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
                '${amount.truncate(digits: 5)} ${state.type.currency}',
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

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    const style = TextStyle(fontSize: 16);
    return Padding(
      padding: _kPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '${s.from}:',
            style: style,
          ),
          const Padding(
            padding: Styles.edgeInsetVertical10,
            child: AccountButton(
              enabled: false,
            ),
          ),
          Text(
            '${s.to}:',
            style: style,
          ),
          const Padding(
            padding: Styles.edgeInsetVertical10,
            child: _AddressBar(),
          ),
        ],
      ),
    );
  }
}

class _AddressBar extends StatelessWidget {
  const _AddressBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendCubit, SendState>(
      buildWhen: (_, __) => false,
      builder: (_, state) => Container(
        padding: Styles.edgeInsetAll10,
        decoration: Styles.barDecoration,
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
              child: SvgPicture.network(state.avatar),
            ),
            const SizedBox(width: 5),
            Row(
              children: [
                Text(
                  state.address.short,
                ),
                const Icon(Icons.check, color: AppColors.success),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
