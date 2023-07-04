import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/lock_screen/lock_screen.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/onboarding/onboarding_page.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/splash/splash_page.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/wallet_connect/wallet_connect_page.dart';
import 'package:chain_wallet_mobile/src/features/settings/presentation/settings_page.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/wallet_page.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/create_page.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/import/import_page.dart';
import 'package:chain_wallet_mobile/src/routing/go_router_refresh_stream.dart';
import 'package:chain_wallet_mobile/src/routing/mobile_scaffold.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash('/splash'),
  onboarding('/onboarding'),
  connect('/connect'),
  import('/import'),
  create('/create'),
  locked('/locked'),
  home('/'),
  transactions('/transactions'),
  settings('/settings');

  const AppRoute(this.path);

  final String path;
}

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();

  static final _homeKey = GlobalKey<NavigatorState>(debugLabel: 'home');

  static final _transactionsKey = GlobalKey<NavigatorState>(debugLabel: 'transactions');

  static final _settingsKey = GlobalKey<NavigatorState>(debugLabel: 'settings');

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoute.splash.path,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    refreshListenable: GoRouterRefreshStream(getIt<AuthCubit>().stream),
    routes: [
      GoRoute(
        path: AppRoute.splash.path,
        name: AppRoute.splash.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: const SplashPage(),
        ),
        redirect: (context, state) {
          final settings = context.read<SettingsBloc>();
          final status = getIt<AuthCubit>().state.status;
          final loading = status == AuthStatus.loading;
          if (!loading && settings.isFirstInstall) {
            return AppRoute.onboarding.path;
          } else if (status == AuthStatus.setup) {
            return AppRoute.connect.path;
          } else if (status == AuthStatus.connected) {
            return AppRoute.locked.path;
          }
          return null;
        },
      ),
      GoRoute(
        path: AppRoute.onboarding.path,
        name: AppRoute.onboarding.name,
        pageBuilder: (context, state) {
          return DefaultTransitionPage(
            key: state.pageKey,
            child: const OnboardingPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoute.connect.path,
        name: AppRoute.connect.name,
        pageBuilder: (context, state) {
          return DefaultTransitionPage(
            key: state.pageKey,
            child: const WalletConnectPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoute.import.path,
        name: AppRoute.import.name,
        pageBuilder: (context, state) {
          return DefaultTransitionPage(
            key: state.pageKey,
            child: const ImportPage(),
          );
        },
      ),
      GoRoute(
        path: AppRoute.create.path,
        name: AppRoute.create.name,
        pageBuilder: (context, state) {
          return DefaultTransitionPage(
            key: state.pageKey,
            child: const CreatePage(),
          );
        },
      ),
      GoRoute(
        path: AppRoute.locked.path,
        name: AppRoute.locked.name,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          child: LockScreenView(
            correctString: getIt<AuthService>().passcode,
          ),
        ),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MobileScaffold(shell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _homeKey,
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                name: AppRoute.home.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const WalletPage(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _transactionsKey,
            routes: [
              GoRoute(
                path: AppRoute.transactions.path,
                name: AppRoute.transactions.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const Placeholder(),
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _settingsKey,
            routes: [
              GoRoute(
                path: AppRoute.settings.path,
                name: AppRoute.settings.name,
                pageBuilder: (context, state) => NoTransitionPage(
                  key: state.pageKey,
                  child: const SettingsPage(),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}
