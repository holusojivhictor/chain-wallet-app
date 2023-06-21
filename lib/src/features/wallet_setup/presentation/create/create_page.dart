import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/app_bar/logo_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/page_slider.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/pages/pages.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';


class CreatePage extends StatelessWidget {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => Injection.pageCubit,
        ),
        BlocProvider(
          create: (ctx) => Injection.createCubit(ctx.read<PageCubit>()),
        ),
      ],
      child: const _PortraitLayout(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout();

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[
      const CreatePinView(),
      const SecureWalletView(),
      const RecoveryPhraseView(),
      const ConfirmPhraseView(),
      const ConfirmationSuccessView(),
    ];

    return BlocBuilder<PageCubit, PageState>(
      builder: (ctx, state) => BlocPresentationListener<CreateCubit>(
        listener: refresh,
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: Scaffold(
            appBar: LogoAppBar(
              leading: state.page == 1 || state.page + 1 == children.length
                  ? null
                  : InkWell(
                      onTap: () => handlePop(context, state.page),
                      child: const Icon(
                        Icons.arrow_back,
                        color: AppColors.primary,
                      ),
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

  void handlePop(BuildContext ctx, int page) {
    if (page == 0) {
      ctx.go(AppRoute.connect.path);
    } else {
      ctx.read<PageCubit>().previous();
    }
  }

  void refresh(BuildContext context, BlocPresentationEvent event) {
    final s = S.of(context);
    final fToast = ToastUtils.of(context);

    if (event is EmptyPhaseInput) {
      ToastUtils.showInfoToast(fToast, s.inputWordError);
    } else if (event is WrongPhraseOrder) {
      DialogUtils.showPrimaryDialog(
        context,
        s.confirmPhrase,
        s.wordOrderError,
        actionText: s.close,
      );
    } else if (event is ConfirmPhraseSuccess) {
      ToastUtils.showSucceedToast(fToast, s.confirmationSuccess);
    }
  }
}
