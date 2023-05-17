import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/app_svgs.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/padded_text.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/presentation/shared/logo_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletConnectPage extends StatelessWidget {
  const WalletConnectPage({Key? key}) : super(key: key);

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
                        onPressed: () => navigateTo(context, const SessionEvent.importWallet()),
                      ),
                      PrimaryButton(
                        text: s.createNewWallet,
                        onPressed: () => navigateTo(context, const SessionEvent.createWallet()),
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

  void navigateTo(BuildContext context, SessionEvent event) {
    context.read<SessionBloc>().add(event);
  }
}
