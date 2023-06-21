import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/home/application/bloc.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:go_router/go_router.dart';
import 'package:local_auth/local_auth.dart';

class LockScreenView extends StatefulWidget {
  const LockScreenView({required this.correctString, super.key});

  final String correctString;

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
    context.read<WalletsBloc>().add(const WalletsEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (ctx, state) {
                final useBiometric = state.unlockWithBiometrics;
                return ScreenLock(
                  correctString: widget.correctString,
                  useBlur: false,
                  onUnlocked: () {
                    context.go(AppRoute.home.path);
                  },
                  customizedButtonChild:
                      useBiometric ? const Icon(Icons.fingerprint) : null,
                  customizedButtonTap:
                      useBiometric ? () async => localAuth(context, s) : null,
                  onOpened:
                      useBiometric ? () async => localAuth(context, s) : null,
                );
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 90,
                  vertical: 10,
                ),
                child: Text(
                  s.passcodeAddsSecurity,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                    fontSize: 11,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> localAuth(BuildContext context, S s) async {
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
        if (context.mounted) {
          context.go(AppRoute.home.path);
        }
      }
    } on PlatformException catch (_) {}
  }
}
