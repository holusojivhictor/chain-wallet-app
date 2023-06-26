import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';

/// The service class wrapping persisted application settings.
abstract class SettingsService {
  /// The current app settings.
  AppSettings get appSettings;

  /// The app theme type.
  ///
  /// Default is [AppThemeType.light].
  AppThemeType get appTheme;
  set appTheme(AppThemeType theme);

  /// The app language type.
  ///
  /// Default is [AppLanguageType.english].
  AppLanguageType get language;
  set language(AppLanguageType lang);

  /// The network the client is currently connected to.
  ///
  /// Default is [EthereumChain.mainnet].
  EthereumChain get chain;
  set chain(EthereumChain chain);

  /// Whether this is the app's first install.
  bool get isFirstInstall;
  set isFirstInstall(bool itIs);

  /// Whether the user has to click `back` twice to exit the app.
  ///
  /// Default is `true`
  bool get doubleBackToClose;
  set doubleBackToClose(bool value);

  /// Whether the user can choose to unlock the app with biometrics.
  ///
  /// Default is `true`
  bool get unlockWithBiometrics;
  set unlockWithBiometrics(bool value);

  /// The app auto theme mode type.
  ///
  /// Default is [AutoThemeModeType.off]
  AutoThemeModeType get autoThemeMode;
  set autoThemeMode(AutoThemeModeType themeMode);

  /// Initialize application settings.
  Future<void> init();
}
