import 'package:chain_wallet_mobile/src/features/common/domain/constants.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/buttons/primary_button.dart';
import 'package:chain_wallet_mobile/src/features/common/presentation/styles.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/application/create/create_cubit.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/chips/phrase_choice_list.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/chips/random_phrase_list.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/header_column.dart';
import 'package:chain_wallet_mobile/src/localization/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmPhraseView extends StatelessWidget {
  const ConfirmPhraseView({super.key});

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
          child: BlocBuilder<CreateCubit, CreateState>(
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
                            duration: const Duration(milliseconds: 300),
                            reverseDuration: const Duration(milliseconds: 50),
                            transitionBuilder: basicSlide,
                            child: RandomPhraseList(
                              key: ValueKey(state.key),
                              values: state.modifiablePhrase,
                              selectedValue: state.selectedRandom!,
                              onSelected: (v) {
                                context.read<CreateCubit>().selectedRandomChanged(v);
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
                            duration: const Duration(milliseconds: 300),
                            reverseDuration: const Duration(milliseconds: 50),
                            transitionBuilder: basicSlide,
                            child: PhraseChoiceList(
                              key: ValueKey(state.key),
                              values: state.paddedRandomPhrase,
                              selectedValues: state.selectedPadded,
                              onSelected: (v) {
                                context.read<CreateCubit>().selectedPaddedChanged(v);
                              },
                            ),
                          ),
                        ),
                      ),
                      PrimaryButton(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                        text: s.next,
                        onPressed: () {
                          context.read<CreateCubit>().confirmPhrase();
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
