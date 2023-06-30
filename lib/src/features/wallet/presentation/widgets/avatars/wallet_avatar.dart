import 'package:chain_wallet_mobile/src/features/common/presentation/images/transparent_image.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletAvatar extends StatelessWidget {
  const WalletAvatar({
    required this.avatarUrl,
    super.key,
  });

  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      child: SvgPicture.network(
        avatarUrl,
        height: 35,
        semanticsLabel: s.avatarLabel,
        placeholderBuilder: (ctx) => Image.memory(kTransparentImage),
      ),
    );
  }
}
