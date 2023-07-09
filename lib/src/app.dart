import 'package:chain_wallet_mobile/src/config/injection.dart';
import 'package:chain_wallet_mobile/src/features/app_widget.dart';
import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChainWalletApp extends StatelessWidget {
  const ChainWalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) {
            final preferenceService = getIt<PreferenceService>();
            final dataService = getIt<DataService>();
            return SendCubit(preferenceService, dataService);
          },
        ),
        BlocProvider(
          create: (ctx) {
            final dataService = getIt<DataService>();
            final preferenceService = getIt<PreferenceService>();
            final authService = getIt<AuthService>();
            final walletService = getIt<WalletService>();
            return WalletBloc(
              dataService,
              preferenceService,
              authService,
              walletService,
              getIt<AuthCubit>(),
              ctx.read<SendCubit>(),
            );
          },
        ),
        BlocProvider(
          create: (ctx) {
            final loggingService = getIt<LoggingService>();
            final preferenceService = getIt<PreferenceService>();
            final localeService = getIt<LocaleService>();
            final deviceInfoService = getIt<DeviceInfoService>();
            return AppBloc(
              loggingService,
              preferenceService,
              localeService,
              deviceInfoService,
            )..add(const AppEvent.init());
          },
        ),
        BlocProvider(
          create: (ctx) {
            final preferenceService = getIt<PreferenceService>();
            final deviceInfoService = getIt<DeviceInfoService>();
            return SettingsBloc(
              preferenceService,
              deviceInfoService,
              ctx.read<AppBloc>(),
            )..add(const SettingsEvent.init());
          },
        ),
      ],
      child: BlocBuilder<AppBloc, AppState>(
        builder: (ctx, state) => const AppWidget(),
      ),
    );
  }
}
