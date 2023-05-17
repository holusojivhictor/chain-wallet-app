import 'package:chain_wallet_mobile/domain/app_constants.dart';
import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:chain_wallet_mobile/domain/services/services.dart';

class LocaleServiceImpl implements LocaleService {
  final SettingsService _settingsService;

  LocaleServiceImpl(this._settingsService);

  @override
  LanguageModel getLocaleWithoutLang() {
    return getLocale(_settingsService.language);
  }

  @override
  LanguageModel getLocale(AppLanguageType language) {
    if (!languagesMap.entries.any((kvp) => kvp.key == language)) {
      throw Exception('The language = $language is not a valid value');
    }

    return languagesMap.entries.firstWhere((kvp) => kvp.key == language).value;
  }
}
