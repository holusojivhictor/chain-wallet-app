import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/bottom_sheet/wallets_bottom_sheet.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountButton extends StatelessWidget {
  const AccountButton({
    super.key,
    this.controller,
    this.enabled = true,
  });

  final AnimationController? controller;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled
          ? () => ModalBottomSheetUtils.showAppModalBottomSheet(
                context,
                EndDrawerItemType.wallets,
                controller: controller,
                args: WalletsBottomSheet.buildArgs(selection: true),
              )
          : null,
      child: BlocBuilder<WalletBloc, WalletState>(
        buildWhen: enabled
            ? (prev, current) => prev.activeWallet != current.activeWallet
            : (_, __) => false,
        builder: (_, state) => Container(
          padding: Styles.edgeInsetAll10,
          decoration: Styles.barDecoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _AccountRow(
                url: state.activeWallet.avatar,
                name: state.activeWallet.name,
                balance: state.activeWallet.walletBalance,
                currency: state.currentChain.currency,
              ),
              if (enabled) const Icon(Icons.arrow_drop_down, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountRow extends StatelessWidget {
  const _AccountRow({
    required this.url,
    required this.name,
    required this.balance,
    required this.currency,
  });

  final String url;
  final String name;
  final double balance;
  final String currency;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.transparent,
          child: SvgPicture.network(url),
        ),
        const SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: textTheme.bodyMedium!.copyWith(fontSize: 15),
            ),
            const SizedBox(height: 4),
            Text(
              '${s.balance}: ${balance.fixed(5)} $currency',
              style: textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}
