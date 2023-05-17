import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/shared/extensions/app_theme_type_extensions.dart';
import 'package:chain_wallet_mobile/presentation/shared/loading.dart';
import 'package:chain_wallet_mobile/session_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delegates = <LocalizationsDelegate>[
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    return BlocBuilder<MainBloc, MainState>(
      builder: (ctx, state) => state.map(
        loading: (_) => MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: delegates,
          theme: AppThemeType.light.getLightTheme(),
          home: const Loading(),
        ),
        loaded: (s) {
          final autoMode = s.autoThemeMode == AutoThemeModeType.on;
          final locale = Locale(s.language.code, s.language.countryCode);
          return MaterialApp(
            title: s.appTitle,
            theme: autoMode ? AppThemeType.light.getLightTheme() : s.theme.getThemeData(s.theme),
            darkTheme: autoMode ? AppThemeType.light.getDarkTheme() : null,
            locale: locale,
            debugShowCheckedModeBanner: false,
            localizationsDelegates: delegates,
            supportedLocales: S.delegate.supportedLocales,
            home: BlocBuilder<SessionBloc, SessionState>(
              builder: (ctx, state) => const SessionWrapper(),
            ),
          );
        },
      ),
    );
  }
}
