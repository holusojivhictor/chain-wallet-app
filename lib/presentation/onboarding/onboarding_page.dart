import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/app_constants.dart';
import 'package:chain_wallet_mobile/domain/assets.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/onboarding/widgets/onboarding_content.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/presentation/shared/logo_app_bar.dart';
import 'package:chain_wallet_mobile/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);

    List<OnboardingData> data = [
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
                      onPressed: () => context.read<SessionBloc>().add(const SessionEvent.connectWallet()),
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
      duration: kAnimationDuration,
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
