import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/assets.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_column.dart';

class SecureWalletView extends StatelessWidget {
  const SecureWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: HeaderColumn(
            title: s.secureWallet,
            subtitle: s.secureWalletDesc,
          ),
        ),
        Expanded(
          flex: 80,
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
    context.read<PageViewBloc>().add(const PageViewEvent.next());
  }
}
