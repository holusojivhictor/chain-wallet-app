import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';
part 'app_settings.g.dart';

@freezed
class AppSettings with _$AppSettings {
  factory AppSettings({
    required AppThemeType appTheme,
    required AppLanguageType appLanguage,
    required EthereumChain chain,
    required bool useDarkMode,
    required bool isFirstInstall,
    required bool doubleBackToClose,
    required bool unlockWithBiometrics,
    required AutoThemeModeType themeMode,
  }) = _AppSettings;

  factory AppSettings.fromJson(Map<String, dynamic> json) => _$AppSettingsFromJson(json);
}
