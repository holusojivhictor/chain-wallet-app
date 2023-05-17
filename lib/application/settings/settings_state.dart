part of 'settings_bloc.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.loading() = _LoadingState;

  const factory SettingsState.loaded({
    required AppThemeType currentTheme,
    required AppLanguageType currentLanguage,
    required String appVersion,
    required bool doubleBackToClose,
    required bool unlockWithBiometrics,
    required AutoThemeModeType themeMode,
    @Default(false) bool isLoading,
  }) = _LoadedState;
}
