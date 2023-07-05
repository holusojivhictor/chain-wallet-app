import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/settings_list_tile.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/routing/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SettingsListTile(
          title: s.general,
          subtitle: s.generalDescription,
          onTap: () => context.go(AppRoute.general.path),
        ),
        SettingsListTile(
          title: s.securityAndPrivacy,
          subtitle: s.privacyDescription,
          onTap: () => context.go(AppRoute.security.path),
        ),
        SettingsListTile(
          title: s.networks,
          subtitle: s.networksDescription,
          onTap: () => context.go(AppRoute.networks.path),
        ),
        SettingsListTile(
          title: s.about,
          subtitle: '',
          onTap: () => context.go(AppRoute.about.path),
        ),
      ],
    );
  }
}
