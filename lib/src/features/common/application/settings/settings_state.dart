part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.themeMode,
    required this.currentTheme,
    required this.currentLanguage,
    required this.currency,
    required this.primary,
    required this.appVersion,
    required this.doubleBackToClose,
    required this.unlockWithBiometrics,
  });

  const SettingsState.init()
      : themeMode = AutoThemeModeType.off,
        currentTheme = AppThemeType.dark,
        currentLanguage = AppLanguageType.english,
        currency = CurrencyType.usd,
        primary = PrimaryCurrency.native,
        appVersion = '1.0',
        doubleBackToClose = true,
        unlockWithBiometrics = true;

  SettingsState copyWith({
    AutoThemeModeType? themeMode,
    AppThemeType? currentTheme,
    AppLanguageType? currentLanguage,
    CurrencyType? currency,
    PrimaryCurrency? primary,
    String? appVersion,
    bool? doubleBackToClose,
    bool? unlockWithBiometrics,
  }) {
    return SettingsState(
      themeMode: themeMode ?? this.themeMode,
      currentTheme: currentTheme ?? this.currentTheme,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      currency: currency ?? this.currency,
      primary: primary ?? this.primary,
      appVersion: appVersion ?? this.appVersion,
      doubleBackToClose: doubleBackToClose ?? this.doubleBackToClose,
      unlockWithBiometrics: unlockWithBiometrics ?? this.unlockWithBiometrics,
    );
  }

  final AutoThemeModeType themeMode;
  final AppThemeType currentTheme;
  final AppLanguageType currentLanguage;
  final CurrencyType currency;
  final PrimaryCurrency primary;
  final String appVersion;
  final bool doubleBackToClose;
  final bool unlockWithBiometrics;

  @override
  List<Object?> get props => [
    themeMode,
    currentTheme,
    currentLanguage,
    currency,
    primary,
    appVersion,
    doubleBackToClose,
    unlockWithBiometrics,
  ];
}
