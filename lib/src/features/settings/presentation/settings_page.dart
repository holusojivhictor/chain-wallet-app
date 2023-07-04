import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/settings_view.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(s.settings),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: SingleChildScrollView(child: SettingsView()),
      ),
    );
  }
}
