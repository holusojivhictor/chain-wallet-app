import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';
import 'package:chain_wallet_mobile/infrastructure/infrastructure.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  static PageViewBloc get pageViewBloc {
    return PageViewBloc();
  }

  static CreateWalletBloc createWalletBloc(PageViewBloc bloc) {
    final walletService = getIt<WalletService>();
    final appService = getIt<ChainWalletAppService>();
    return CreateWalletBloc(walletService, appService, bloc);
  }

  static ImportWalletBloc importWalletBloc(SessionBloc bloc) {
    final walletService = getIt<WalletService>();
    final appService = getIt<ChainWalletAppService>();
    return ImportWalletBloc(walletService, appService, bloc);
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

    getIt.registerSingleton<ChainWalletAppService>(
      ChainWalletServiceAppImpl(walletService),
    );
  }
}
