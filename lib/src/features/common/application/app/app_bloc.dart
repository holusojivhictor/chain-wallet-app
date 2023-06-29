import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_bloc.freezed.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(
    this._logger,
    this._preferenceService,
    this._localeService,
    this._deviceInfoService,
  ) : super(const AppState.init()) {
    on<_Init>(_onInit);
    on<_LanguageChanged>(_onLanguageChanged);
    on<_ThemeChanged>(_onThemeChanged);
    on<_ThemeModeChanged>(_onThemeModeChanged);
  }

  final LoggingService _logger;
  final PreferenceService _preferenceService;
  final LocaleService _localeService;
  final DeviceInfoService _deviceInfoService;

  AppState loadedState(
    AppThemeType theme,
    AutoThemeModeType autoThemeMode, {
    bool isInitialized = true,
  }) {
    return const AppState.init().copyWith(
      appTitle: _deviceInfoService.appName,
      initialized: isInitialized,
      theme: theme,
      autoThemeMode: autoThemeMode,
      language: _localeService.getLocaleWithoutLang(),
      firstInstall: _preferenceService.isFirstInstall,
      versionChanged: _deviceInfoService.versionChanged,
    );
  }

  void _logInfo() {
    _logger.info(
        runtimeType,
        '_init: Is first install = ${_preferenceService.isFirstInstall}. '
        'Refreshing settings');
  }

  void _onInit(_Init event, Emitter<AppState> emit) {
    _logger.info(runtimeType, '_init: Initializing all...');

    final preferences = _preferenceService.preferences;
    _logInfo();

    emit(loadedState(preferences.appTheme, preferences.themeMode));
  }

  void _onLanguageChanged(_LanguageChanged event, Emitter<AppState> emit) {
    _logger.info(runtimeType, '_init: Language changed, reloading blocs');

    final preferences = _preferenceService.preferences;
    _logInfo();

    emit(loadedState(preferences.appTheme, preferences.themeMode));
  }

  void _onThemeChanged(_ThemeChanged event, Emitter<AppState> emit) {
    _logInfo();

    emit(loadedState(event.newValue, _preferenceService.autoThemeMode));
  }

  void _onThemeModeChanged(_ThemeModeChanged event, Emitter<AppState> emit) {
    _logInfo();

    emit(loadedState(_preferenceService.appTheme, event.newValue));
  }
}
