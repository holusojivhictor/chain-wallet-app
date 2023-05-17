import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:local_auth/local_auth.dart';

class LockScreenView extends StatelessWidget {
  final String correctString;

  const LockScreenView({Key? key, required this.correctString}) : super(key: key);

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
              builder: (ctx, state) => state.map(
                loading: (_) => const Loading(useScaffold: false),
                loaded: (state) {
                  final useBiometric = state.unlockWithBiometrics;
                  return ScreenLock(
                    correctString: correctString,
                    useBlur: false,
                    onUnlocked: () {
                      context.read<SessionBloc>().add(const SessionEvent.initStartup());
                    },
                    customizedButtonChild: useBiometric ? const Icon(Icons.fingerprint) : null,
                    customizedButtonTap: useBiometric ? () async => await localAuth(context, s) : null,
                    onOpened: useBiometric ? () async => await localAuth(context, s) : null,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                child: Text(
                  s.passcodeAddsSecurity,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodySmall!.copyWith(color: Colors.white, fontSize: 11),
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
        options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );
      if (didAuthenticate) {
        if (context.mounted) {
          context.read<SessionBloc>().add(const SessionEvent.initStartup());
        }
      }
    } on PlatformException catch (_) {}
  }
}
