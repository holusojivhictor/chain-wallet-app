import 'package:chain_wallet_mobile/src/features/common/domain/constants.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:collection/collection.dart' show IterableExtension;
import 'package:devicelocale/devicelocale.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceServiceImpl extends PreferenceService {
  PreferenceServiceImpl(this._logger);

  final _appThemeKey = 'AppTheme';
  final _appLanguageKey = 'AppLanguage';
  final _ethereumChainKey = 'EthereumChain';
  final _currencyTypeKey = 'CurrencyType';
  final _primaryCurrencyKey = 'PrimaryCurrency';
  final _isFirstInstallKey = 'FirstInstall';
  final _doubleBackToCloseKey = 'DoubleBackToClose';
  final _unlockWithBiometricsKey = 'UnlockWithBiometrics';
  final _autoThemeModeKey = 'AutoThemeMode';
  final _activeWalletIdKey = 'ActiveWalletId';

  bool _initialized = false;

  late SharedPreferences _prefs;
  final LoggingService _logger;

  @override
  AppThemeType get appTheme => AppThemeType.values[_prefs.getInt(_appThemeKey)!];

  @override
  set appTheme(AppThemeType theme) => _prefs.setInt(_appThemeKey, theme.index);

  @override
  AppLanguageType get language => AppLanguageType.values[_prefs.getInt(_appLanguageKey)!];

  @override
  set language(AppLanguageType lang) => _prefs.setInt(_appLanguageKey, lang.index);

  @override
  ChainType get chain => ChainType.values[_prefs.getInt(_ethereumChainKey)!];

  @override
  set chain(ChainType chain) => _prefs.setInt(_ethereumChainKey, chain.index);

  @override
  CurrencyType get currency => CurrencyType.values[_prefs.getInt(_currencyTypeKey)!];

  @override
  set currency(CurrencyType currency) => _prefs.setInt(_currencyTypeKey, currency.index);

  @override
  PrimaryCurrency get primary => PrimaryCurrency.values[_prefs.getInt(_primaryCurrencyKey)!];

  @override
  set primary(PrimaryCurrency primary) => _prefs.setInt(_primaryCurrencyKey, primary.index);

  @override
  bool get isFirstInstall => _prefs.getBool(_isFirstInstallKey)!;

  @override
  set isFirstInstall(bool itIs) => _prefs.setBool(_isFirstInstallKey, itIs);

  @override
  bool get doubleBackToClose => _prefs.getBool(_doubleBackToCloseKey)!;

  @override
  set doubleBackToClose(bool value) => _prefs.setBool(_doubleBackToCloseKey, value);

  @override
  bool get unlockWithBiometrics => _prefs.getBool(_unlockWithBiometricsKey)!;

  @override
  set unlockWithBiometrics(bool value) => _prefs.setBool(_unlockWithBiometricsKey, value);

  @override
  AutoThemeModeType get autoThemeMode => AutoThemeModeType.values[_prefs.getInt(_autoThemeModeKey)!];

  @override
  set autoThemeMode(AutoThemeModeType themeMode) => _prefs.setInt(_autoThemeModeKey, themeMode.index);

  @override
  int get activeWalletId => _prefs.getInt(_activeWalletIdKey)!;

  @override
  set activeWalletId(int id) => _prefs.setInt(_activeWalletIdKey, id);

  @override
  Preferences get preferences => Preferences(
    appTheme: appTheme,
    appLanguage: language,
    chain: chain,
    currency: currency,
    primary: primary,
    useDarkMode: false,
    isFirstInstall: isFirstInstall,
    doubleBackToClose: doubleBackToClose,
    unlockWithBiometrics: unlockWithBiometrics,
    themeMode: autoThemeMode,
    activeWalletId: activeWalletId,
  );

  @override
  Future<void> init() async {
    if (_initialized) {
      _logger.info(runtimeType, 'Preferences are already initialized!');
      return;
    }

    _logger.info(runtimeType, 'Initializing preferences...Getting shared preferences instance...');

    _prefs = await SharedPreferences.getInstance();

    if (_prefs.get(_isFirstInstallKey) == null) {
      _logger.info(runtimeType, 'This is the first install of the app');
      isFirstInstall = true;
    } else {
      isFirstInstall = false;
    }

    if (_prefs.get(_appThemeKey) == null) {
      _logger.info(runtimeType, 'Setting light as the default theme');
      appTheme = AppThemeType.light;
    }

    if (_prefs.get(_appLanguageKey) == null) {
      language = await _getDefaultLangToUse();
    }

    if (_prefs.get(_ethereumChainKey) == null) {
      _logger.info(runtimeType, 'Ethereum network is set to `mainnet` as default');
      chain = ChainType.goerli;
    }

    if (_prefs.get(_currencyTypeKey) == null) {
      _logger.info(runtimeType, 'Currency type is set to `usd` as default');
      currency = CurrencyType.usd;
    }

    if (_prefs.get(_primaryCurrencyKey) == null) {
      _logger.info(runtimeType, 'Primary currency is set to `native` as default');
      primary = PrimaryCurrency.native;
    }

    if (_prefs.get(_activeWalletIdKey) == null) {
      _logger.info(runtimeType, 'Default active wallet id is 0');
      activeWalletId = 0;
    }

    if (_prefs.get(_doubleBackToCloseKey) == null) {
      _logger.info(runtimeType, 'Double back to close will be set to its default (true)');
      doubleBackToClose = true;
    }

    if (_prefs.get(_unlockWithBiometricsKey) == null) {
      _logger.info(runtimeType, 'Unlock with biometrics will be set to its default (true)');
      unlockWithBiometrics = true;
    }

    if (_prefs.get(_autoThemeModeKey) == null) {
      _logger.info(runtimeType, 'Auto theme mode set to false as default');
      autoThemeMode = AutoThemeModeType.off;
    }

    _initialized = true;
    _logger.info(runtimeType, 'Preferences were initialized successfully');
  }

  Future<AppLanguageType> _getDefaultLangToUse() async {
    try {
      _logger.info(runtimeType, '_getDefaultLangToUse: Trying to retrieve device lang...');
      final deviceLocale = await Devicelocale.currentAsLocale;
      if (deviceLocale == null) {
        _logger.warning(
          runtimeType,
          "_getDefaultLangToUse: Couldn't retrieve the device locale, defaulting to english",
        );
        return AppLanguageType.english;
      }

      final appLang = languagesMap.entries.firstWhereOrNull((val) => val.value.code == deviceLocale.languageCode);
      if (appLang == null) {
        _logger.info(
          runtimeType,
          "_getDefaultLangToUse: Couldn't find an appropriate app language for = ${deviceLocale.languageCode}_${deviceLocale.countryCode}, defaulting to english",
        );
        return AppLanguageType.english;
      }

      _logger.info(
        runtimeType,
        '_getDefaultLangToUse: Found an appropriate language to use for = ${deviceLocale.languageCode}_${deviceLocale.countryCode}, that is = ${appLang.key}',
      );
      return appLang.key;
    } catch (e, s) {
      _logger.error(runtimeType, '_getDefaultLangToUse: Unknown error occurred', ex: e, trace: s);
      return AppLanguageType.english;
    }
  }
}
