import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/svg_image.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 3000), () {
      getIt<AuthCubit>().init();
    });
  }

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
              children: <Widget>[
                Text(
                  s.appName,
                  style: theme.textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: SvgAsset(
                image: Assets.getSvgPath('floral.svg'),
                color: theme.canvasColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
