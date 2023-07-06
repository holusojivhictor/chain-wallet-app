import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/theme.dart';
import 'package:flutter/material.dart';

extension AppThemeTypeExtensions on AppThemeType {
  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.black),
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFEEEEEC),
      typography: AppTheme.appMaterialTypography,
      primaryTextTheme: AppTheme.appMaterialLightPrimaryTextTheme,
      textTheme: AppTheme.appMaterialLightTextTheme,
      colorScheme: AppTheme.appMaterialLightColorScheme,
      dividerTheme: const DividerThemeData(
        color: AppColors.grey4,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeExtension(
          baseTextColor: Colors.black,
          navSelectedColor: AppColors.variantBlack,
          navUnselectedColor: AppColors.variantGrey4,
        ),
      ],
    );
  }

  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.white),
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF23272A),
      typography: AppTheme.appMaterialTypography,
      primaryTextTheme: AppTheme.appMaterialDarkPrimaryTextTheme,
      textTheme: AppTheme.appMaterialDarkTextTheme,
      colorScheme: AppTheme.appMaterialDarkColorScheme,
      dividerTheme: const DividerThemeData(
        color: AppColors.grey4,
      ),
      extensions: const <ThemeExtension<dynamic>>[
        AppThemeExtension(
          baseTextColor: Colors.white,
          navSelectedColor: AppColors.white,
          navUnselectedColor: AppColors.grey6,
        ),
      ],
    );
  }

  ThemeData get themeData {
    switch (this) {
      case AppThemeType.light:
        return lightTheme;
      case AppThemeType.dark:
        return darkTheme;
    }
  }
}
