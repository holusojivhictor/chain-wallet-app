import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/bottom_sheets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/avatars/chain_avatar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/dialogs/network_dialog.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletsBottomSheet extends StatelessWidget {
  const WalletsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (prev, current) => prev.currentChain != current.currentChain,
      builder: (ctx, state) => CommonBottomSheet(
        showOkButton: false,
        showCancelButton: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 5),
            _NetworkBar(chain: state.currentChain),
            BottomSheetTitle(title: s.accounts),
          ],
        ),
      ),
    );
  }
}

class _NetworkBar extends StatelessWidget {
  const _NetworkBar({required this.chain});

  final EthereumChain chain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: AppColors.grey3,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: () => show(context),
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ChainAvatar(chain: chain),
                const SizedBox(width: 5),
                Text(chain.label),
                const SizedBox(width: 5),
                const Icon(Icons.arrow_drop_down_outlined),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (ctx) => const NetworkDialog(),
    );
  }
}
