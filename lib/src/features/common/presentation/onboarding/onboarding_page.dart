import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/constants.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/app_bar/logo_app_bar.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/onboarding/widgets/onboarding_content.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    final data = <OnboardingData>[
      OnboardingData(
        header: s.welcomeToChainWallet,
        subtitle: s.welcomeToChainWalletDesc,
        image: Assets.getImagePath('shield.png'),
      ),
      OnboardingData(
        header: s.incognitoAssets,
        subtitle: s.incognitoAssetsDesc,
        image: Assets.getImagePath('shield.png'),
      ),
      OnboardingData(
        header: s.portfolioControl,
        subtitle: s.portfolioControlDesc,
        image: Assets.getImagePath('shield.png'),
      ),
    ];

    return Scaffold(
      appBar: const LogoAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              flex: 70,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    _currentPage = value;
                  });
                },
                itemCount: data.length,
                itemBuilder: (context, index) => OnboardingContent(
                  header: data[index].header,
                  subtitle: data[index].subtitle,
                  image: data[index].image,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(data.length, (index) => buildDot(index: index)),
            ),
            Flexible(
              flex: 15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: Styles.edgeInsetHorizontal5,
                    child: PrimaryButton(
                      text: s.getStarted,
                      isPrimary: false,
                      onPressed: () {
                        context.go(AppRoute.connect.path);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(right: kPadding / 2),
      height: 6,
      width: _currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: _currentPage == index ? AppColors.primary : Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
