part of 'settings_bloc.dart';

class SettingsState extends Equatable {
  const SettingsState({
    required this.currentTheme,
    required this.currentLanguage,
    required this.appVersion,
    required this.doubleBackToClose,
    required this.unlockWithBiometrics,
    required this.themeMode,
  });

  const SettingsState.init()
      : currentTheme = AppThemeType.dark,
        currentLanguage = AppLanguageType.english,
        appVersion = '1.0',
        doubleBackToClose = true,
        unlockWithBiometrics = true,
        themeMode = AutoThemeModeType.off;

  SettingsState copyWith({
    AppThemeType? currentTheme,
    AppLanguageType? currentLanguage,
    String? appVersion,
    bool? doubleBackToClose,
    bool? unlockWithBiometrics,
    AutoThemeModeType? themeMode,
  }) {
    return SettingsState(
      currentTheme: currentTheme ?? this.currentTheme,
      currentLanguage: currentLanguage ?? this.currentLanguage,
      appVersion: appVersion ?? this.appVersion,
      doubleBackToClose: doubleBackToClose ?? this.doubleBackToClose,
      unlockWithBiometrics: unlockWithBiometrics ?? this.unlockWithBiometrics,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  final AppThemeType currentTheme;
  final AppLanguageType currentLanguage;
  final String appVersion;
  final bool doubleBackToClose;
  final bool unlockWithBiometrics;
  final AutoThemeModeType themeMode;

  @override
  List<Object?> get props => [
    currentTheme,
    currentLanguage,
    appVersion,
    doubleBackToClose,
    unlockWithBiometrics,
    themeMode,
  ];
}
