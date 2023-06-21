import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';

abstract class LocaleService {
  Language getLocaleWithoutLang();

  Language getLocale(AppLanguageType language);
}
