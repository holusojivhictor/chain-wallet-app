import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final delegates = <LocalizationsDelegate<dynamic>>[
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
    return BlocBuilder<AppBloc, AppState>(
      builder: (ctx, s) {
        final auto = s.autoThemeMode == AutoThemeModeType.on;
        final locale = Locale(s.language.code, s.language.countryCode);

        return MaterialApp.router(
          title: s.appTitle,
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.router,
          theme: auto ? s.theme.lightTheme : s.theme.themeData,
          darkTheme: auto ? s.theme.darkTheme : null,
          locale: locale,
          localizationsDelegates: delegates,
          supportedLocales: S.delegate.supportedLocales,
        );
      },
    );
  }
}
