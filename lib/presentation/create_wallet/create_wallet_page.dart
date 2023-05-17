import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/injection.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/shared/logo_app_bar.dart';
import 'package:chain_wallet_mobile/presentation/shared/utils/dialog_utils.dart';
import 'package:chain_wallet_mobile/presentation/shared/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/confirm_phrase.dart';
import 'widgets/confirmation_success.dart';
import 'widgets/create_pin.dart';
import 'widgets/page_slider.dart';
import 'widgets/recovery_phrase.dart';
import 'widgets/secure_wallet.dart';

class CreateWalletPage extends StatelessWidget {
  const CreateWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => Injection.pageViewBloc..add(const PageViewEvent.init()),
        ),
        BlocProvider(
          create: (ctx) => Injection.createWalletBloc(ctx.read<PageViewBloc>()),
        ),
      ],
      child: const _PortraitLayout(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final List<Widget> children = [
      const CreatePinView(),
      const SecureWalletView(),
      const RecoveryPhraseView(),
      const ConfirmPhraseView(),
      const ConfirmationSuccessView(),
    ];

    return BlocBuilder<PageViewBloc, PageViewState>(
      builder: (ctx, state) => BlocPresentationListener<CreateWalletBloc>(
        listener: (context, event) {
          final fToast = ToastUtils.of(context);

          if (event is EmptyPhaseInput) {
            ToastUtils.showInfoToast(fToast, s.inputWordError);
          } else if (event is WrongPhraseOrder) {
            DialogUtils.showPrimaryDialog(context, s.confirmPhrase, s.wordOrderError, actionText: s.close);
          } else if (event is ConfirmPhraseSuccess) {
            ToastUtils.showSucceedToast(fToast, s.confirmationSuccess);
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: LogoAppBar(
              leading: state.page == 1 || state.page + 1 == children.length ? null
                  : InkWell(
                      onTap: () {
                        if (state.page == 0) {
                          context.read<SessionBloc>().add(const SessionEvent.connectWallet());
                        } else {
                          context.read<PageViewBloc>().add(const PageViewEvent.previous());
                        }
                      },
                      child: const Icon(Icons.arrow_back,
                          color: AppColors.primary),
                    ),
            ),
            body: SafeArea(
              child: Column(
                children: [
                  PageSlider(
                    stop: state.page + 1,
                    length: children.length,
                  ),
                  Expanded(
                    child: PageView(
                      controller: state.controller,
                      pageSnapping: true,
                      allowImplicitScrolling: false,
                      physics: const NeverScrollableScrollPhysics(),
                      children: children,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
