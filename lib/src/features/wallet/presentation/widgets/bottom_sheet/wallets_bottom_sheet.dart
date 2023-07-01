import 'package:chain_wallet_mobile/src/features/common/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/bottom_sheets/bottom_sheets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/avatars/avatars.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/dialogs/network_dialog.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/lists/lists.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletsBottomSheet extends StatefulWidget {
  const WalletsBottomSheet({super.key});

  @override
  State<WalletsBottomSheet> createState() => _WalletsBottomSheetState();
}

class _WalletsBottomSheetState extends State<WalletsBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<WalletBloc, WalletState>(
      buildWhen: (prev, current) => prev.currentChain != current.currentChain,
      builder: (ctx, state) => CommonBottomSheet(
        showOkButton: false,
        showCancelButton: false,
        child: Column(
          children: [
            const SizedBox(height: 5),
            _NetworkBar(chain: state.currentChain),
            BottomSheetTitle(title: s.accounts),
            WalletsListBar(onWalletTapped: onWalletTapped),
            const _ButtonBar(),
          ],
        ),
      ),
    );
  }

  void onWalletTapped(Wallet wallet) {
    context
        .read<WalletBloc>()
        .add(WalletEvent.activeWalletChanged(key: wallet.key));
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

class _ButtonBar extends StatelessWidget {
  const _ButtonBar();

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.sizeOf(context).width / 1.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          PrimaryButton(
            onPressed: () => create(context),
            text: s.createNewAccount,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  void create(BuildContext context) {
    context.read<WalletBloc>().add(const WalletEvent.createSubAgent());
  }
}
