import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/presentation/create_wallet/create_wallet_page.dart';
import 'package:chain_wallet_mobile/presentation/import_wallet/import_wallet_page.dart';
import 'package:chain_wallet_mobile/presentation/lock_screen/lock_screen.dart';
import 'package:chain_wallet_mobile/presentation/main_tab_page.dart';
import 'package:chain_wallet_mobile/presentation/onboarding/onboarding_page.dart';
import 'package:chain_wallet_mobile/presentation/splash/splash_page.dart';
import 'package:chain_wallet_mobile/presentation/wallet_connect/wallet_connect_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SessionWrapper extends StatelessWidget {
  const SessionWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SessionBloc, SessionState>(
      builder: (context, state) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: handleTransition,
        child: state.map(
          unInitialized: (_) => const SplashPage(),
          onboardingState: (_) => const OnboardingPage(),
          walletConnectState: (_) => const WalletConnectPage(),
          importWalletState: (_) => const ImportWalletPage(),
          createWalletState: (_) => const CreateWalletPage(),
          authState: (s) => LockScreenView(
            correctString: s.passcode,
          ),
          authenticated: (_) => const MainTabPage(),
        ),
      ),
    );
  }

  FadeTransition handleTransition(
    Widget child,
    Animation<double> animation,
  ) {
    final List<TweenSequenceItem<double>> fastOutExtraSlowInTweenSequenceItems =
        <TweenSequenceItem<double>>[
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.0, end: 0.4).chain(CurveTween(curve: const Cubic(0.05, 0.0, 0.133333, 0.06))),
        weight: 0.166666,
      ),
      TweenSequenceItem<double>(
        tween: Tween<double>(begin: 0.4, end: 1.0).chain(CurveTween(curve: const Cubic(0.208333, 0.82, 0.25, 1.0))),
        weight: 1.0 - 0.166666,
      ),
    ];

    final TweenSequence<double> scaleCurveSequence = TweenSequence<double>(fastOutExtraSlowInTweenSequenceItems);

    final Animatable<double> fadeInTransition = Tween<double>(
      begin: 0.0,
      end: 1.00,
    ).chain(CurveTween(curve: const Interval(0.125, 0.250)));

    final Animatable<double> scaleUpTransition = Tween<double>(
      begin: 0.85,
      end: 1.00,
    ).chain(scaleCurveSequence);

    final Animation<double> fadeTransition = fadeInTransition.animate(animation);

    final Animation<double> scaleTransition = scaleUpTransition.animate(animation);

    return FadeTransition(
      opacity: fadeTransition,
      child: ScaleTransition(scale: scaleTransition, child: child),
    );
  }
}
