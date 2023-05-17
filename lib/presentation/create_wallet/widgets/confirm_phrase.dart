import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/domain/app_constants.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/create_wallet/widgets/phrase_choice_list.dart';
import 'package:chain_wallet_mobile/presentation/create_wallet/widgets/random_phrase_list.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/presentation/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'header_column.dart';

class ConfirmPhraseView extends StatelessWidget {
  const ConfirmPhraseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Column(
      children: [
        Expanded(
          flex: 15,
          child: HeaderColumn(
            title: s.confirmPhrase,
            subtitle: s.confirmPhraseDesc,
          ),
        ),
        Expanded(
          flex: 80,
          child: BlocBuilder<CreateWalletBloc, CreateWalletState>(
            builder: (ctx, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 40,
                  child: Container(
                    margin: Styles.edgeInsetAll16,
                    padding: Styles.edgeInsetAll16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFB3B9B7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(s.selectWordInOrder),
                        const SizedBox(height: 20),
                        Flexible(
                          child: AnimatedSwitcher(
                            duration: kAnimationDuration,
                            reverseDuration: const Duration(milliseconds: 50),
                            transitionBuilder: basicSlide,
                            child: RandomPhraseList(
                              key: ValueKey(state.key),
                              values: state.modifiablePhrase,
                              selectedValue: state.selectedRandom!,
                              onSelected: (v) {
                                context.read<CreateWalletBloc>().add(CreateWalletEvent.selectedRandomChanged(value: v));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Flexible(
                  flex: 60,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: AnimatedSwitcher(
                            duration: kAnimationDuration,
                            reverseDuration: const Duration(milliseconds: 50),
                            transitionBuilder: basicSlide,
                            child: PhraseChoiceList(
                              key: ValueKey(state.key),
                              values: state.paddedRandomPhrase,
                              selectedValues: state.selectedPadded,
                              onSelected: (v) {
                                context.read<CreateWalletBloc>().add(CreateWalletEvent.selectedPaddedChanged(value: v));
                              },
                            ),
                          ),
                        ),
                      ),
                      PrimaryButton(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        text: s.next,
                        onPressed: () {
                          context.read<CreateWalletBloc>().add(const CreateWalletEvent.confirmPhrase());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
