import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/domain/models/models.dart';

abstract class LocaleService {
  LanguageModel getLocaleWithoutLang();

  LanguageModel getLocale(AppLanguageType language);
}
