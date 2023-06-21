import 'package:bloc_presentation/bloc_presentation.dart';
import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/app_bar/logo_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/home/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/import/import_cubit.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/import/widgets/import_form.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:chain_wallet_mobile/src/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ImportPage extends StatelessWidget {
  const ImportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => Injection.importCubit,
      child: const _PortraitLayout(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return BlocPresentationListener<ImportCubit>(
      listener: refresh,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: LogoAppBar(
            leading: InkWell(
              onTap: () {
                context.go(AppRoute.connect.path);
              },
              child: const Icon(Icons.arrow_back, color: AppColors.primary),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Text(
                      s.importFromSeed,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.titleLarge!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  const ImportForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void refresh(BuildContext context, BlocPresentationEvent event) {
    final s = S.of(context);

    if (event is IncompletePhrase) {
      DialogUtils.showPrimaryDialog(
        context,
        s.importFromSeed,
        s.phraseLengthError,
        actionText: s.close,
      );
    } else if (event is ImportSuccess) {
      DialogUtils.showPrimaryDialog(
        context,
        s.importSuccess,
        s.setupSuccess,
        actionText: s.goHome,
        actionOnPressed: () {
          // TODO(morpheus): relocate init
          context.read<WalletsBloc>().add(const WalletsEvent.init());
          context.go(AppRoute.home.path);
        },
      );
    }
  }
}