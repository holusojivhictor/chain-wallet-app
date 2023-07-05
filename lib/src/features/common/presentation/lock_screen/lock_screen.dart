import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class LockScreenView extends StatefulWidget {
  const LockScreenView({
    required this.correctString,
    this.import = false,
    super.key,
  });

  final String correctString;
  final bool import;

  @override
  State<LockScreenView> createState() => _LockScreenViewState();
}

class _LockScreenViewState extends State<LockScreenView> {
  bool _didChangeDependencies = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_didChangeDependencies) return;
    _didChangeDependencies = true;
    context.read<WalletBloc>().add(WalletEvent.init(startUp: widget.import));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                final useBiometric = state.unlockWithBiometrics;
                return BlocConsumer<AuthCubit, AuthState>(
                  bloc: getIt<AuthCubit>(),
                  listenWhen: (prev, curr) => prev.appStatus != curr.appStatus,
                  listener: (_, state) {
                    if (state.appStatus == AppStatus.unlocked) {
                      loading();
                      context
                          .read<WalletBloc>()
                          .add(const WalletEvent.loadPrices());
                    } else if (state.appStatus == AppStatus.busy) {
                      context.go(AppRoute.home.path);
                    }
                  },
                  builder: (_, state) => ScreenLock(
                    correctString: widget.correctString,
                    useBlur: false,
                    onUnlocked: () => getIt<AuthCubit>().unlock(),
                    customizedButtonChild:
                        useBiometric ? const Icon(Icons.fingerprint) : null,
                    customizedButtonTap:
                        useBiometric ? () async => localAuth() : null,
                    onOpened: useBiometric ? () async => localAuth() : null,
                  ),
                );
              },
            ),
            const _BottomText(),
          ],
        ),
      ),
    );
  }

  Future<void> localAuth() async {
    final s = S.of(context);

    final auth = LocalAuthentication();
    try {
      final didAuthenticate = await auth.authenticate(
        localizedReason: s.authenticateReason,
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (didAuthenticate) {
        getIt<AuthCubit>().unlock();
      }
    } on PlatformException catch (_) {}
  }
}

class _BottomText extends StatelessWidget {
  const _BottomText();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final s = S.of(context);

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 90,
          vertical: 10,
        ),
        child: Text(
          s.passcodeAddsSecurity,
          textAlign: TextAlign.center,
          style: textTheme.bodySmall!.copyWith(
            color: Colors.white,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
