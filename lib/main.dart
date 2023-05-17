import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:chain_wallet_mobile/presentation/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const ChainWalletApp());
}

class ChainWalletApp extends StatelessWidget {
  const ChainWalletApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => MainTabBloc()),
        BlocProvider(
          create: (ctx) {
            final settingsService = getIt<SettingsService>();
            final walletService = getIt<ChainWalletAppService>();
            return SessionBloc(
              settingsService,
              walletService,
            )..add(const SessionEvent.appStarted(init: true));
          },
        ),
        BlocProvider(
          create: (ctx) {
            final loggingService = getIt<LoggingService>();
            final settingsService = getIt<SettingsService>();
            final localeService = getIt<LocaleService>();
            final deviceInfoService = getIt<DeviceInfoService>();
            return MainBloc(
              loggingService,
              settingsService,
              localeService,
              deviceInfoService
            )..add(const MainEvent.init());
          },
        ),
        BlocProvider(
          create: (ctx) {
            final settingsService = getIt<SettingsService>();
            final deviceInfoService = getIt<DeviceInfoService>();
            return SettingsBloc(
              settingsService,
              deviceInfoService,
              ctx.read<MainBloc>(),
            )..add(const SettingsEvent.init());
          },
        ),
        BlocProvider(
          create: (ctx) {
            final dataService = getIt<DataService>();
            return WalletsBloc(dataService)..add(const WalletsEvent.init());
          },
        ),
      ],
      child: BlocBuilder<MainBloc, MainState>(
        builder: (ctx, state) => const AppWidget(),
      ),
    );
  }
}
