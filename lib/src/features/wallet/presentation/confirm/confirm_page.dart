import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/dialogs/transaction_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/confirm/widgets/bottom_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/account_button.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/page_wrapper.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

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

        return BlocConsumer<SendCubit, SendState>(
          listener: (ctx, state) {
            final fToast = ToastUtils.of(context);
            if (state.status == SendStatus.success) {
              ToastUtils.showCustomToast(
                fToast,
                const TransactionBar(),
                gravity: ToastGravity.SNACKBAR,
              );
              context.go(AppRoute.home.path);
              context.read<SendCubit>().reset();
            }
          },
          builder: (ctx, state) => PageWrapper(
            title: s.confirm,
            type: state.type,
            enabled: true,
            buttonText: s.send,
            loading: state.status == SendStatus.loading,
            onPressed: () {
              context.read<SendCubit>().send(active);
            },
            body: const Column(
              children: [
                _TopBar(),
                BottomBar(),
              ],
            ),
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
