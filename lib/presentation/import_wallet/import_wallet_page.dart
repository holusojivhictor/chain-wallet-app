import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/injection.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/shared/logo_app_bar.dart';
import 'package:chain_wallet_mobile/presentation/shared/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/import_form.dart';

class ImportWalletPage extends StatelessWidget {
  const ImportWalletPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (ctx) => Injection.importWalletBloc(ctx.read<SessionBloc>()),
      child: const _PortraitLayout(),
    );
  }
}

class _PortraitLayout extends StatelessWidget {
  const _PortraitLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);
    return BlocPresentationListener<ImportWalletBloc>(
      listener: (context, event) {
        if (event is IncompletePhrase) {
          DialogUtils.showPrimaryDialog(context, s.importFromSeed, s.phraseLengthError, actionText: s.close);
        }
      },
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: LogoAppBar(
            leading: InkWell(
              onTap: () => context.read<SessionBloc>().add(const SessionEvent.connectWallet()),
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
                      style: theme.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
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
}
