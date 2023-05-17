import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/app_svgs.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/padded_text.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmationSuccessView extends StatelessWidget {
  const ConfirmationSuccessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Expanded(
          flex: 20,
          child: AppSvgs.iconCheck,
        ),
        Expanded(
          flex: 80,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _TextBox(
                title: s.congratulations,
                subtitle: s.walletSuccessfullyProtected,
                altSubtitle: s.cannotRecoverWallet,
              ),
              PrimaryButton(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                text: s.finish,
                onPressed: () {
                  context.read<SessionBloc>().add(const SessionEvent.initStartup());
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class _TextBox extends StatelessWidget {
  final String title;
  final String subtitle;
  final String altSubtitle;

  const _TextBox({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.altSubtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          title,
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            letterSpacing: 0.25,
          ),
        ),
        const SizedBox(height: 10),
        PaddedText(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          text: subtitle,
          textAlign: TextAlign.center,
          textStyle: textTheme.bodyLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        PaddedText(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          text: altSubtitle,
          textAlign: TextAlign.center,
          textStyle: textTheme.bodyLarge!.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
