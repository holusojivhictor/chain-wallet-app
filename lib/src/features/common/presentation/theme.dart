import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static Typography appMaterialTypography = Typography(
    black: appMaterialBlackTheme,
    white: appMaterialWhiteTheme,
    englishLike: appMaterialEnglishLikeTextTheme,
    dense: appMaterialDenseTextTheme,
    tall: appMaterialTallTextTheme,
  );

  static const fontFamily = 'Sora';

  static ColorScheme appMaterialLightColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    background: AppColors.white,
  );

  static ColorScheme appMaterialDarkColorScheme = ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.dark,
    secondary: AppColors.secondary,
    tertiary: AppColors.tertiary,
    background: AppColors.white,
  );

  static TextTheme appMaterialBlackTheme = const TextTheme(
    displayLarge: TextStyle(debugLabel: 'blackSora displayLarge', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    displayMedium: TextStyle(debugLabel: 'blackSora displayMedium', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    displaySmall: TextStyle(debugLabel: 'blackSora displaySmall', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    headlineLarge: TextStyle(debugLabel: 'blackSora headlineLarge', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    headlineMedium: TextStyle(debugLabel: 'blackSora headlineMedium', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    headlineSmall: TextStyle(debugLabel: 'blackSora headlineSmall', fontFamily: fontFamily, color: Colors.black87, decoration: TextDecoration.none,),
    titleLarge: TextStyle(debugLabel: 'blackSora titleLarge', fontFamily: fontFamily, color: Colors.black87, decoration: TextDecoration.none,),
    titleMedium: TextStyle(debugLabel: 'blackSora titleMedium', fontFamily: fontFamily, color:Colors.black87, decoration: TextDecoration.none, ),
    titleSmall: TextStyle(debugLabel: 'blackSora titleSmall', fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none,),
    bodyLarge: TextStyle(debugLabel: 'blackSora bodyLarge', fontFamily: fontFamily, color: Colors.black87, decoration: TextDecoration.none,),
    bodyMedium: TextStyle(debugLabel: 'blackSora bodyMedium', fontFamily: fontFamily, color: Colors.black87, decoration: TextDecoration.none,),
    bodySmall: TextStyle(debugLabel: 'blackSora bodySmall', fontFamily: fontFamily, color: Colors.black54, decoration: TextDecoration.none,),
    labelLarge: TextStyle(debugLabel: 'blackSora labelLarge', fontFamily: fontFamily, color: Colors.black87, decoration: TextDecoration.none,),
    labelMedium: TextStyle(debugLabel: 'blackSora labelMedium', fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none,),
    labelSmall: TextStyle(debugLabel: 'blackSora labelSmall', fontFamily: fontFamily, color: Colors.black, decoration: TextDecoration.none,),
  );

  static TextTheme appMaterialWhiteTheme = const TextTheme(
    displayLarge: TextStyle(debugLabel: 'whiteSora displayLarge', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    displayMedium: TextStyle(debugLabel: 'whiteSora displayMedium', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    displaySmall: TextStyle(debugLabel: 'whiteSora displaySmall', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    headlineLarge: TextStyle(debugLabel: 'whiteSora headlineLarge', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    headlineMedium: TextStyle(debugLabel: 'whiteSora headlineMedium', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    headlineSmall: TextStyle(debugLabel: 'whiteSora headlineSmall', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    titleLarge: TextStyle(debugLabel: 'whiteSora titleLarge', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    titleMedium: TextStyle(debugLabel: 'whiteSora titleMedium', fontFamily: fontFamily, color:Colors.white, decoration: TextDecoration.none, ),
    titleSmall: TextStyle(debugLabel: 'whiteSora titleSmall', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    bodyLarge: TextStyle(debugLabel: 'whiteSora bodyLarge', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    bodyMedium: TextStyle(debugLabel: 'whiteSora bodyMedium', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    bodySmall: TextStyle(debugLabel: 'whiteSora bodySmall', fontFamily: fontFamily, color: Colors.white70, decoration: TextDecoration.none,),
    labelLarge: TextStyle(debugLabel: 'whiteSora labelLarge', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    labelMedium: TextStyle(debugLabel: 'whiteSora labelMedium', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
    labelSmall: TextStyle(debugLabel: 'whiteSora labelSmall', fontFamily: fontFamily, color: Colors.white, decoration: TextDecoration.none,),
  );

  static TextTheme appMaterialEnglishLikeTextTheme = const TextTheme(
    displayLarge: TextStyle(debugLabel: 'englishLike displayLarge ', fontSize: 96, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -1.5, ),
    displayMedium: TextStyle(debugLabel: 'englishLike displayMedium', fontSize: 60, fontWeight: FontWeight.w300, textBaseline: TextBaseline.alphabetic, letterSpacing: -0.5,),
    displaySmall: TextStyle(debugLabel: 'englishLike displaySmall', fontSize: 48, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0,),
    headlineLarge: TextStyle(debugLabel: 'englishLike headlineLarge', fontSize: 40, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25,),
    headlineMedium: TextStyle(debugLabel: 'englishLike headlineMedium', fontSize: 34, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25,),
    headlineSmall: TextStyle(debugLabel: 'englishLike headlineSmall', fontSize: 24, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing:0,),
    titleLarge: TextStyle(debugLabel: 'englishLike titleLarge', fontSize: 20, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.15,),
    titleMedium: TextStyle(debugLabel: 'englishLike titleMedium', fontSize: 16, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.15,),
    titleSmall: TextStyle(debugLabel: 'englishLike titleSmall', fontSize: 14, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.1,),
    bodyLarge: TextStyle(debugLabel: 'englishLike bodyLarge', fontSize: 16, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.5,),
    bodyMedium: TextStyle(debugLabel: 'englishLike bodyMedium', fontSize: 14, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.25,),
    bodySmall: TextStyle(debugLabel: 'englishLike bodySmall', fontSize: 12, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 0.4,),
    labelLarge: TextStyle(debugLabel: 'englishLike labelLarge', fontSize: 14, fontWeight: FontWeight.w500, textBaseline: TextBaseline.alphabetic, letterSpacing: 1.25,),
    labelMedium: TextStyle(debugLabel: 'englishLike labelMedium', fontSize: 11, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 1.5,),
    labelSmall: TextStyle(debugLabel: 'englishLike labelSmall', fontSize: 10, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic, letterSpacing: 1.5,),
  );

  static TextTheme appMaterialDenseTextTheme = const TextTheme(
    displayLarge: TextStyle(debugLabel: 'dense displayLarge', inherit: false, fontSize: 112, fontWeight: FontWeight.w100, textBaseline: TextBaseline.ideographic,),
    displayMedium: TextStyle(debugLabel: 'dense displayMedium', inherit: false, fontSize: 56, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    displaySmall: TextStyle(debugLabel: 'dense displaySmall', inherit: false, fontSize: 45, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineLarge: TextStyle(debugLabel: 'dense headlineLarge',inherit: false, fontSize: 40, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineMedium: TextStyle(debugLabel: 'dense headlineMedium', inherit: false, fontSize: 34, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineSmall: TextStyle(debugLabel: 'dense headlineSmall', inherit: false, fontSize: 24, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    titleLarge: TextStyle(debugLabel: 'dense titleLarge', inherit: false, fontSize: 21, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic,),
    titleMedium: TextStyle(debugLabel: 'dense titleMedium', inherit: false, fontSize: 17, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    titleSmall: TextStyle(debugLabel: 'dense titleSmall', inherit: false, fontSize: 15, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic,),
    bodyLarge: TextStyle(debugLabel: 'dense bodyLarge', inherit: false, fontSize: 15, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic,),
    bodyMedium: TextStyle(debugLabel: 'dense bodyMedium', inherit: false, fontSize: 15, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    bodySmall: TextStyle(debugLabel: 'dense bodySmall', inherit: false, fontSize: 13, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    labelLarge: TextStyle(debugLabel: 'dense labelLarge', inherit: false, fontSize: 15, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic,),
    labelMedium: TextStyle(debugLabel: 'dense labelMedium', inherit: false, fontSize: 12, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    labelSmall: TextStyle(debugLabel: 'dense labelSmall', inherit: false, fontSize: 11, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
  );

  static TextTheme appMaterialTallTextTheme = const TextTheme(
    displayLarge: TextStyle(debugLabel: 'tall displayLarge', inherit: false, fontSize: 112, fontWeight: FontWeight.w400, textBaseline: TextBaseline.alphabetic,),
    displayMedium: TextStyle(debugLabel: 'tall displayMedium', inherit: false, fontSize: 56, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    displaySmall: TextStyle(debugLabel: 'tall displaySmall', inherit: false, fontSize: 45, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineLarge: TextStyle(debugLabel: 'tall headlineLarge', inherit: false, fontSize: 40, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineMedium: TextStyle(debugLabel: 'tall headlineMedium', inherit: false, fontSize: 34, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    headlineSmall: TextStyle(debugLabel: 'tall headlineSmall', inherit: false, fontSize: 24, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    titleLarge: TextStyle(debugLabel: 'tall titleLarge', inherit: false, fontSize: 24, fontWeight: FontWeight.w700, textBaseline: TextBaseline.ideographic,),
    titleMedium: TextStyle(debugLabel: 'tall titleMedium', inherit: false, fontSize: 21, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    titleSmall: TextStyle(debugLabel: 'tall titleSmall', inherit: false, fontSize: 17, fontWeight: FontWeight.w500, textBaseline: TextBaseline.ideographic,),
    bodyLarge: TextStyle(debugLabel: 'tall bodyLarge', inherit: false, fontSize: 15, fontWeight: FontWeight.w700, textBaseline: TextBaseline.ideographic,),
    bodyMedium: TextStyle(debugLabel: 'tall bodyMedium', inherit: false, fontSize: 15, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    bodySmall: TextStyle(debugLabel: 'tall bodySmall', inherit: false, fontSize: 13, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    labelLarge: TextStyle(debugLabel: 'tall labelLarge', inherit: false, fontSize: 15, fontWeight: FontWeight.w700, textBaseline: TextBaseline.ideographic,),
    labelMedium: TextStyle(debugLabel: 'tall labelMedium', inherit: false, fontSize: 12, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
    labelSmall: TextStyle(debugLabel: 'tall labelSmall', inherit: false, fontSize: 11, fontWeight: FontWeight.w400, textBaseline: TextBaseline.ideographic,),
  );

  static TextTheme appMaterialLightTextTheme = const TextTheme(
    displayLarge: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w900,),
    displayMedium: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w800,),
    displaySmall: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,),
    headlineLarge: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w900,),
    headlineMedium: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontStyle: FontStyle.normal),
    bodyMedium: TextStyle(fontStyle: FontStyle.normal),
    bodySmall: TextStyle(fontStyle: FontStyle.normal),
    labelLarge: TextStyle(fontStyle: FontStyle.normal),
    labelMedium: TextStyle(fontStyle: FontStyle.normal),
    labelSmall: TextStyle(fontStyle: FontStyle.normal),
  );

  static TextTheme appMaterialLightPrimaryTextTheme = TextTheme(
    displayLarge: TextStyle(color: appMaterialLightColorScheme.tertiary),
    displayMedium: TextStyle(color: appMaterialLightColorScheme.tertiary),
    displaySmall: TextStyle(color: appMaterialLightColorScheme.tertiary),
    headlineLarge: TextStyle(color: appMaterialLightColorScheme.tertiary),
    headlineMedium: TextStyle(color: appMaterialLightColorScheme.tertiary),
    headlineSmall: TextStyle(color: appMaterialLightColorScheme.tertiary),
    bodyLarge: TextStyle(color: appMaterialLightColorScheme.tertiary),
    bodyMedium: TextStyle(color: appMaterialLightColorScheme.tertiary),
    bodySmall: TextStyle(color: appMaterialLightColorScheme.tertiary),
    labelLarge: TextStyle(color: appMaterialLightColorScheme.tertiary),
    labelMedium: TextStyle(color: appMaterialLightColorScheme.tertiary),
    labelSmall: TextStyle(color: appMaterialLightColorScheme.tertiary),
  );

  static TextTheme appMaterialDarkTextTheme = const TextTheme(
    displayLarge: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w900,),
    displayMedium: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w800,),
    displaySmall: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,),
    headlineLarge: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w900,),
    headlineMedium: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w800,),
    headlineSmall: TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w600,),
    bodyLarge: TextStyle(fontStyle: FontStyle.normal,),
    bodyMedium: TextStyle(fontStyle: FontStyle.normal),
    bodySmall: TextStyle(fontStyle: FontStyle.normal),
    labelLarge: TextStyle(fontStyle: FontStyle.normal),
    labelMedium: TextStyle(fontStyle: FontStyle.normal),
    labelSmall: TextStyle(fontStyle: FontStyle.normal),
  );

  static TextTheme appMaterialDarkPrimaryTextTheme = TextTheme(
    displayLarge: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    displayMedium: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    displaySmall: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    headlineLarge: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    headlineMedium: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    headlineSmall: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    bodyLarge: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    bodyMedium: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    bodySmall: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    labelLarge: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    labelMedium: TextStyle(color: appMaterialDarkColorScheme.tertiary),
    labelSmall: TextStyle(color: appMaterialDarkColorScheme.tertiary),
  );
}

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  const AppThemeExtension({
    required this.baseTextColor,
    required this.navSelectedColor,
    required this.navUnselectedColor,
  });

  final Color? baseTextColor;
  final Color? navSelectedColor;
  final Color? navUnselectedColor;

  @override
  AppThemeExtension copyWith({
    Color? baseTextColor,
    Color? navSelectedColor,
    Color? navUnselectedColor,
  }) {
    return AppThemeExtension(
      baseTextColor: baseTextColor ?? this.baseTextColor,
      navSelectedColor: navSelectedColor ?? this.navSelectedColor,
      navUnselectedColor: navUnselectedColor ?? this.navUnselectedColor,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }

    return AppThemeExtension(
      baseTextColor: Color.lerp(baseTextColor, other.baseTextColor, t),
      navSelectedColor: Color.lerp(navSelectedColor, other.navSelectedColor, t),
      navUnselectedColor: Color.lerp(navUnselectedColor, other.navUnselectedColor, t),
    );
  }
}
