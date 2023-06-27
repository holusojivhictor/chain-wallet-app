import 'package:chain_wallet_mobile/src/extensions/i18n_extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/images/transparent_image.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/modal_bottom_sheet_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountBarTile extends StatelessWidget {
  const AccountBarTile({
    required this.accountName,
    required this.avatarUrl,
    required this.type,
    super.key,
  });

  final String accountName;
  final String avatarUrl;
  final AccountType type;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final s = S.of(context);
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -3, vertical: -1),
      leading: CircleAvatar(
        backgroundColor: Colors.transparent,
        child: SvgPicture.network(
          avatarUrl,
          height: 35,
          semanticsLabel: s.avatarLabel,
          placeholderBuilder: (ctx) => Image.memory(kTransparentImage),
        ),
      ),
      title: Text(accountName),
      subtitle: Row(
        children: [
          CircleAvatar(
            backgroundColor: type.dot,
            radius: 3,
          ),
          const SizedBox(width: 5),
          Text(s.translateAccountType(type)),
        ],
      ),
      splashColor: theme.scaffoldBackgroundColor,
      onTap: () => ModalBottomSheetUtils.showAppModalBottomSheet(
        context,
        EndDrawerItemType.wallets,
      ),
      trailing: InkResponse(
        onTap: () {},
        child: const Icon(Icons.qr_code_scanner_outlined),
      ),
    );
  }
}
