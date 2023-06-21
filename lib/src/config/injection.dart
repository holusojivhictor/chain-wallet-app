import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/common/infrastructure/infrastructure.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/infrastructure/infrastructure.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static PageCubit get pageCubit {
    return PageCubit();
  }

  static ImportCubit get importCubit {
    final walletService = getIt<WalletService>();
    final authService = getIt<AuthService>();
    return ImportCubit(walletService, authService);
  }

  static CreateCubit createCubit(PageCubit cubit) {
    final walletService = getIt<WalletService>();
    final authService = getIt<AuthService>();
    return CreateCubit(walletService, authService, cubit);
  }

  static Future<void> init() async {
    final deviceInfoService = DeviceInfoServiceImpl();
    getIt.registerSingleton<DeviceInfoService>(deviceInfoService);
    await deviceInfoService.init();

    final loggingService = LoggingServiceImpl();
    getIt.registerSingleton<LoggingService>(loggingService);

    final settingsService = SettingsServiceImpl(loggingService);
    await settingsService.init();
    getIt.registerSingleton<SettingsService>(settingsService);

    final localeService = LocaleServiceImpl(settingsService);
    getIt.registerSingleton<LocaleService>(localeService);

    final dataService = DataServiceImpl();
    await dataService.init();
    getIt.registerSingleton<DataService>(dataService);

    final walletService = WalletServiceImpl(loggingService, dataService);
    await walletService.init();
    getIt.registerSingleton<WalletService>(walletService);

    final authService = AuthServiceImpl(walletService);
    await authService.init();
    getIt
      ..registerSingleton<AuthService>(authService)
      ..registerSingleton(AuthCubit(authService));
  }
}
