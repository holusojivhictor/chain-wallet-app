import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
    this.leading,
  });

  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      title: Text(
        s.appName.toUpperCase(),
        style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
      ),
      automaticallyImplyLeading: leading == null,
      leading: leading,
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
