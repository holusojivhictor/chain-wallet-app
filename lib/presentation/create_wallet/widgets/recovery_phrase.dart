import 'dart:ui' as ui;

import 'package:chain_wallet_mobile/application/bloc.dart';
import 'package:chain_wallet_mobile/generated/l10n.dart';
import 'package:chain_wallet_mobile/presentation/colors.dart';
import 'package:chain_wallet_mobile/presentation/create_wallet/widgets/header_column.dart';
import 'package:chain_wallet_mobile/presentation/shared/buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'phrase_box.dart';

class RecoveryPhraseView extends StatefulWidget {
  const RecoveryPhraseView({Key? key}) : super(key: key);

  @override
  State<RecoveryPhraseView> createState() => _RecoveryPhraseViewState();
}

class _RecoveryPhraseViewState extends State<RecoveryPhraseView> {
  bool _phraseVisible = false;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Expanded(
          flex: 20,
          child: HeaderColumn(
            title: s.secureWallet,
            subtitle: s.recoveryPhaseShow,
          ),
        ),
        Expanded(
          flex: 75,
          child: BlocBuilder<CreateWalletBloc, CreateWalletState>(
            builder: (ctx, state) => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 40,
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: _switch,
                        child: Column(
                          children: [
                            Flexible(
                              child: PhraseBox(values: state.seedPhrase),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: !_phraseVisible,
                        child: ClipRRect(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: BackdropFilter(
                              filter: ui.ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF111815).withOpacity(0.9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        s.tapToRevealPhrase,
                                        style: textTheme.bodyLarge!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        s.makeSureNoOneIsAround,
                                        style: textTheme.bodyMedium!.copyWith(
                                          color: AppColors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      PrimaryButton(
                                        onPressed: _switch,
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                                        backgroundColor: AppColors.white,
                                        child: const _ButtonRow(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Flexible(
                  flex: 60,
                  child: PrimaryButton(
                    padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                    text: s.next,
                    onPressed: () => _next(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _next(BuildContext context) {
    context.read<PageViewBloc>().add(const PageViewEvent.next());
  }

  void _switch() {
    setState(() {
      _phraseVisible = !_phraseVisible;
    });
  }
}

class _ButtonRow extends StatelessWidget {
  const _ButtonRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final textTheme = Theme.of(context).textTheme;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.remove_red_eye_outlined, color: AppColors.primary),
        const SizedBox(width: 5),
        Text(
          s.view,
          style: textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
        )
      ],
    );
  }
}
