import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/app_bar/logo_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/text/padded_text.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WalletConnectPage extends StatelessWidget {
  const WalletConnectPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: const LogoAppBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              left: 0,
              child: SvgAsset(
                image: Assets.getSvgPath('floral.svg'),
                color: theme.canvasColor,
              ),
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
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PaddedText(
                        text: s.walletConnectDesc,
                        textStyle: theme.textTheme.bodyMedium,
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
                        onPressed: () => context.go(AppRoute.import.path),
                      ),
                      PrimaryButton(
                        text: s.createNewWallet,
                        onPressed: () => context.go(AppRoute.create.path),
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
