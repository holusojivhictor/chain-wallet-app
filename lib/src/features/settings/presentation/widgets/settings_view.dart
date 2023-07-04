import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/settings_list_tile.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

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
          onTap: () {},
        ),
        SettingsListTile(
          title: s.securityAndPrivacy,
          subtitle: s.privacyDescription,
          onTap: () {},
        ),
        SettingsListTile(
          title: s.networks,
          subtitle: s.networksDescription,
          onTap: () {},
        ),
        SettingsListTile(
          title: s.about,
          subtitle: '',
          onTap: () {},
        ),
      ],
    );
  }
}
