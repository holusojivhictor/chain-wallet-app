import 'package:chain_wallet_mobile/src/features/common/domain/constants.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/language/language.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/services/services.dart';

class LocaleServiceImpl implements LocaleService {
  LocaleServiceImpl(this._settingsService);

  final SettingsService _settingsService;

  @override
  Language getLocaleWithoutLang() {
    return getLocale(_settingsService.language);
  }

  @override
  Language getLocale(AppLanguageType language) {
    if (!languagesMap.entries.any((kvp) => kvp.key == language)) {
      throw Exception('The language = $language is not a valid value');
    }

    return languagesMap.entries.firstWhere((kvp) => kvp.key == language).value;
  }
}
