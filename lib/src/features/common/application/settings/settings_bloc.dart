import 'package:chain_wallet_mobile/src/features/common/application/app/app_bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(
    this._preferenceService,
    this._deviceInfoService,
    this._appBloc,
  ) : super(const SettingsState.init()) {
    on<_Init>(_onInit);
    on<_ThemeChanged>(_onThemeChanged);
    on<_LanguageChanged>(_onLanguageChanged);
    on<_DoubleBackToCloseChanged>(_onDoubleBackToCloseChanged);
    on<_UnlockWithBiometricsChanged>(_onUnlockWithBiometricsChanged);
    on<_AutoThemeModeTypeChanged>(_onAutoThemeModeTypeChanged);
  }

  final PreferenceService _preferenceService;
  final DeviceInfoService _deviceInfoService;
  final AppBloc _appBloc;

  void _onInit(_Init event, Emitter<SettingsState> emit) {
    final preferences = _preferenceService.preferences;

    emit(
      const SettingsState.init().copyWith(
        currentTheme: preferences.appTheme,
        currentLanguage: preferences.appLanguage,
        appVersion: _deviceInfoService.version,
        doubleBackToClose: preferences.doubleBackToClose,
        unlockWithBiometrics: preferences.unlockWithBiometrics,
        themeMode: preferences.themeMode,
      ),
    );
  }

  void _onThemeChanged(_ThemeChanged event, Emitter<SettingsState> emit) {
    if (event.newValue == _preferenceService.appTheme) {
      return emit(state);
    }
    _preferenceService.appTheme = event.newValue;
    _appBloc.add(AppEvent.themeChanged(newValue: event.newValue));
    emit(state.copyWith(currentTheme: event.newValue));
  }

  void _onLanguageChanged(_LanguageChanged event, Emitter<SettingsState> emit) {
    if (event.newValue == _preferenceService.language) {
      return emit(state);
    }
    _preferenceService.language = event.newValue;
    _appBloc.add(AppEvent.languageChanged(newValue: event.newValue));
    emit(state.copyWith(currentLanguage: event.newValue));
  }

  void _onDoubleBackToCloseChanged(
    _DoubleBackToCloseChanged event,
    Emitter<SettingsState> emit,
  ) {
    _preferenceService.doubleBackToClose = event.newValue;
    emit(state.copyWith(doubleBackToClose: event.newValue));
  }

  void _onUnlockWithBiometricsChanged(
    _UnlockWithBiometricsChanged event,
    Emitter<SettingsState> emit,
  ) {
    _preferenceService.unlockWithBiometrics = event.newValue;
    emit(state.copyWith(unlockWithBiometrics: event.newValue));
  }

  void _onAutoThemeModeTypeChanged(
    _AutoThemeModeTypeChanged event,
    Emitter<SettingsState> emit,
  ) {
    if (event.newValue == _preferenceService.autoThemeMode) {
      return emit(state);
    }
    _preferenceService.autoThemeMode = event.newValue;
    _appBloc.add(AppEvent.themeModeChanged(newValue: event.newValue));
    emit(state.copyWith(themeMode: event.newValue));
  }

  bool get doubleBackToClose => _preferenceService.doubleBackToClose;

  bool get isFirstInstall => _preferenceService.isFirstInstall;
}
