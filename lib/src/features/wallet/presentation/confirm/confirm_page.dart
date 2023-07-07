import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/page_wrapper.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<SendCubit, SendState>(
      builder: (ctx, state) => PageWrapper(
        title: s.confirm,
        type: state.type,
        buttonText: s.send,
        onPressed: () {},
        body: const Column(),
      ),
    );
  }
}
