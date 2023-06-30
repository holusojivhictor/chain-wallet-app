import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/common/infrastructure/infrastructure.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/infrastructure/infrastructure.dart';
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
    final authService = getIt<AuthService>();
    return ImportCubit(authService);
  }

  static CreateCubit createCubit(PageCubit cubit) {
    final authService = getIt<AuthService>();
    return CreateCubit(authService, cubit);
  }

  static Future<void> init() async {
    final deviceInfoService = DeviceInfoServiceImpl();
    getIt.registerSingleton<DeviceInfoService>(deviceInfoService);
    await deviceInfoService.init();

    final loggingService = LoggingServiceImpl();
    getIt.registerSingleton<LoggingService>(loggingService);

    final preferenceService = PreferenceServiceImpl(loggingService);
    await preferenceService.init();
    getIt.registerSingleton<PreferenceService>(preferenceService);

    final localeService = LocaleServiceImpl(preferenceService);
    getIt.registerSingleton<LocaleService>(localeService);

    final dataService = DataServiceImpl();
    await dataService.init();
    getIt.registerSingleton<DataService>(dataService);

    final authService = AuthServiceImpl(
      loggingService,
      preferenceService,
      dataService,
    );
    await authService.init();
    getIt
      ..registerSingleton<AuthService>(authService)
      ..registerSingleton(AuthCubit(authService));

    final walletService = WalletServiceImpl();
    getIt.registerSingleton<WalletService>(walletService);
  }
}
