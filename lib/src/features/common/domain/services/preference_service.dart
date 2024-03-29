import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';

/// The service class wrapping persisted application preferences.
abstract class PreferenceService {
  /// The current app settings.
  Preferences get preferences;

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
  /// Default is [ChainType.mainnet].
  ChainType get chain;
  set chain(ChainType chain);

  /// The chosen fiat currency in use.
  ///
  /// Default is [CurrencyType.usd].
  CurrencyType get currency;
  set currency(CurrencyType currency);

  /// Whether primary values are displayed natively or in fiat.
  ///
  /// Default is [PrimaryCurrency.native].
  PrimaryCurrency get primary;
  set primary(PrimaryCurrency primary);

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

  /// Current active wallet's ID
  ///
  /// Default is `0`
  int get activeWalletId;
  set activeWalletId(int id);

  /// Initialize application settings.
  Future<void> init();
}
