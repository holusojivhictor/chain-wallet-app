import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'preferences.freezed.dart';
part 'preferences.g.dart';

@freezed
class Preferences with _$Preferences {
  factory Preferences({
    required AppThemeType appTheme,
    required AppLanguageType appLanguage,
    required EthereumChain chain,
    required bool useDarkMode,
    required bool isFirstInstall,
    required bool doubleBackToClose,
    required bool unlockWithBiometrics,
    required AutoThemeModeType themeMode,
  }) = _Preferences;

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);
}
