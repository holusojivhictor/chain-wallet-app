import 'package:chain_wallet_mobile/src/features/common/domain/enums/enums.dart';
import 'package:chain_wallet_mobile/src/features/wallet/application/bloc.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/send/widgets/address_form.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/error/error_bar.dart';
import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/page_wrapper.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SendPage extends StatelessWidget {
  const SendPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return BlocBuilder<SendCubit, SendState>(
      builder: (ctx, state) => PageWrapper(
        title: s.sendTo,
        type: state.type,
        gestureOn: true,
        buttonText: s.next,
        enabled: state.isAddressValid,
        onPressed: () {
          context.go(AppRoute.amount.path);
          context.read<SendCubit>().saveAddress();
        },
        body: Column(
          children: [
            const AddressForm(),
            const Divider(),
            if (!state.isAddressValid && state.isAddressDirty)
              ErrorBar(
                errorText: s.invalidAddress,
                level: Level.warning,
              ),
          ],
        ),
      ),
    );
  }
}
