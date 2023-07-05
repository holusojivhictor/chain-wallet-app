part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.init() = _Init;

  const factory SettingsEvent.themeChanged({
    required AppThemeType newValue,
  }) = _ThemeChanged;

  const factory SettingsEvent.languageChanged({
    required AppLanguageType newValue,
  }) = _LanguageChanged;

  const factory SettingsEvent.currencyChanged({
    required CurrencyType newValue,
  }) = _CurrencyChanged;

  const factory SettingsEvent.primaryCurrencyChanged({
    required PrimaryCurrency newValue,
  }) = _PrimaryCurrencyChanged;

  const factory SettingsEvent.doubleBackToCloseChanged({
    required bool newValue,
  }) = _DoubleBackToCloseChanged;

  const factory SettingsEvent.unlockWithBiometricsChanged({
    required bool newValue,
  }) = _UnlockWithBiometricsChanged;

  const factory SettingsEvent.autoThemeModeTypeChanged({
    required AutoThemeModeType newValue,
  }) = _AutoThemeModeTypeChanged;
}
