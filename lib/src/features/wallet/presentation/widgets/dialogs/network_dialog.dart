import 'package:chain_wallet_mobile/src/extensions/extensions.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/colors.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/domain/models/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/lists/lists.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NetworkDialog extends StatelessWidget {
  const NetworkDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);
    return AlertDialog(
      elevation: 10,
      alignment: Alignment.center,
      shape: Styles.alertDialogShape,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: AppColors.tertiary,
      titlePadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      title: ListTile(
        leading: const _Transparent(),
        contentPadding: EdgeInsets.zero,
        title: Text(
          s.networks,
          style: theme.textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.close_rounded,
            size: 22,
          ),
        ),
      ),
      content: SizedBox(
        width: mediaQuery.size.width / 1.15,
        height: mediaQuery.heightForDialog(
          ChainType.values.length + 3,
          maxHeight: 350,
        ),
        child: BlocBuilder<WalletBloc, WalletState>(
          builder: (ctx, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CommonChoiceList<ChainType>(
                  selectedValue: state.currentChain,
                  values: ChainType.values,
                  choiceText: (val, _) => val.label,
                  onSelected: (v) {
                    context
                        .read<WalletBloc>()
                        .add(WalletEvent.networkChainChanged(newValue: v));
                    Navigator.pop(context);
                  },
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: PrimaryButton(
                    onPressed: () {
                      // TODO(morpheus): Add network
                    },
                    text: s.addNetwork,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Transparent extends StatelessWidget {
  const _Transparent();

  @override
  Widget build(BuildContext context) {
    return const IconButton(
      onPressed: null,
      icon: Icon(
        Icons.add,
        color: Colors.transparent,
      ),
    );
  }
}
