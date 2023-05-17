import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';

extension I18nExtensions on S {
  String translateAppThemeType(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.dark:
        return dark;
      case AppThemeType.light:
        return light;
      default:
        throw Exception('The provided app theme = $theme is not valid');
    }
  }

  String translateAppLanguageType(AppLanguageType lang) {
    switch (lang) {
      case AppLanguageType.english:
        return 'English';
      default:
        throw Exception('The provided app lang = $lang is not valid');
    }
  }

  String translateAccountType(AccountType type) {
    switch (type) {
      case AccountType.master:
        return masterAddress;
      case AccountType.agent:
        return agentAddress;
      default:
        throw Exception('The provided account type = $type is not valid');
    }
  }
}
