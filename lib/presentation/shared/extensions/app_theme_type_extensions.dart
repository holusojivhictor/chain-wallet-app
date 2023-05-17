import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/theme.dart';
import 'package:flutter/material.dart';

extension AppThemeTypeExtensions on AppThemeType {
  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFEEEEEC),
      typography: AppTheme.appMaterialTypography,
      primaryTextTheme: AppTheme.appMaterialLightPrimaryTextTheme,
      textTheme: AppTheme.appMaterialLightTextTheme,
      colorScheme: AppTheme.appMaterialLightColorScheme,
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeExtension(
          baseTextColor: Colors.black,
        ),
      ],
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF000000),
      typography: AppTheme.appMaterialTypography,
      primaryTextTheme: AppTheme.appMaterialDarkPrimaryTextTheme,
      textTheme: AppTheme.appMaterialDarkTextTheme,
      colorScheme: AppTheme.appMaterialDarkColorScheme,
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeExtension(
          baseTextColor: Colors.white,
        ),
      ],
    );
  }

  ThemeData getThemeData(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.light:
        return getLightTheme();
      case AppThemeType.dark:
        return getDarkTheme();
      default:
        throw Exception('Invalid app theme type provided = $theme');
    }
  }
}
