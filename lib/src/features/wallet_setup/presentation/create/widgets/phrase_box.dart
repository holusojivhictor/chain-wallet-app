import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/chips/phrase_chip.dart';
import 'package:flutter/material.dart';

class PhraseBox extends StatelessWidget {
  const PhraseBox({required this.values, super.key});

  final List<Phrase> values;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      childAspectRatio: 2.6,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: getChips(context, values),
    );
  }

  List<Widget> getChips(BuildContext context, List<Phrase> translatedValues) {
    return translatedValues.map((e) => _buildChip(context, e.position, e.value)).toList();
  }

  Widget _buildChip(BuildContext context, int position, String value) {
    return PhraseChip(
      position: position,
      value: value,
    );
  }
}
