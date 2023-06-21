import 'package:chain_wallet_mobile/src/features/common/domain/app_svgs.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/app_bar/logo_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/text/padded_text.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletConnectPage extends StatelessWidget {
  const WalletConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const LogoAppBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: AppSvgs.floral,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Column(
                    children: [
                      Text(
                        s.walletConnect,
                        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(height: 20),
                      PaddedText(
                        text: s.walletConnectDesc,
                        textStyle: textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PrimaryButton(
                        text: s.importWallet,
                        isPrimary: false,
                        onPressed: () {
                          context.go(AppRoute.import.path);
                        },
                      ),
                      PrimaryButton(
                        text: s.createNewWallet,
                        onPressed: () {
                          context.go(AppRoute.create.path);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
