import 'package:chain_wallet_mobile/src/features/common/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/common/domain/assets.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/header_column.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecureWalletView extends StatelessWidget {
  const SecureWalletView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        HeaderColumn(
          title: s.secureWallet,
          subtitle: s.secureWalletDesc,
        ),
        const SizedBox(height: 25),
        Expanded(
          flex: 85,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 35,
                child: Image.asset(
                  Assets.getImagePath('shield.png'),
                ),
              ),
              Flexible(
                flex: 30,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    s.secureWalletExtra,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge!.copyWith(fontSize: 15),
                  ),
                ),
              ),
              PrimaryButton(
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                text: s.start,
                onPressed: () => _next(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _next(BuildContext context) {
    context.read<PageCubit>().next();
  }
}
