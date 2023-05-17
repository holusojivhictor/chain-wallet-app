import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:flutter/material.dart';

import 'phrase_chip.dart';

class PhraseBox extends StatelessWidget {
  final List<PhraseData> values;
  const PhraseBox({Key? key, required this.values}) : super(key: key);

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

  List<Widget> getChips(BuildContext context, List<PhraseData> translatedValues) {
    return translatedValues.map((e) => _buildChip(context, e.position, e.value)).toList();
  }

  Widget _buildChip(BuildContext context, int position, String value) {
    return PhraseChip(
      position: position,
      value: value,
    );
  }
}
