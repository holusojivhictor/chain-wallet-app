import 'package:chain_wallet_mobile/domain/app_svgs.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  s.appName,
                  style: theme.textTheme.headlineMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: AppSvgs.floral,
            ),
          ],
        ),
      ),
    );
  }
}
