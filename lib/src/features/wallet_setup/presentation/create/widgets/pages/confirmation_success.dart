import 'package:chain_wallet_mobile/src/features/common/domain/app_svgs.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/text/padded_text.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ConfirmationSuccessView extends StatelessWidget {
  const ConfirmationSuccessView({super.key});

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
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 20,
                ),
                text: s.finish,
                onPressed: () {
                  context.go(AppRoute.locked.path, extra: false);
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
  const _TextBox({
    required this.title,
    required this.subtitle,
    required this.altSubtitle,
  });

  final String title;
  final String subtitle;
  final String altSubtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final style = textTheme.bodyLarge!.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    );

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
          textStyle: style,
        ),
        PaddedText(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          text: altSubtitle,
          textAlign: TextAlign.center,
          textStyle: style,
        ),
      ],
    );
  }
}
