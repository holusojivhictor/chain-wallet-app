import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/tiles/app_bar.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: BasicAppBar(
        title: s.about,
      ),
    );
  }
}
