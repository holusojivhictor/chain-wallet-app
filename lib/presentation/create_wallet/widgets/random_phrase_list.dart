import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:flutter/material.dart';

import 'action_phrase_chip.dart';

class RandomPhraseList extends StatelessWidget {
  final PhraseData selectedValue;
  final List<PhraseData> values;
  final Function(PhraseData)? onSelected;

  const RandomPhraseList({
    Key? key,
    required this.values,
    required this.selectedValue,
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      children: getChoices(context),
    );
  }

  List<Widget> getChoices(BuildContext context) {
    return values.map((e) => _buildChoiceTile(context, e)).toList();
  }

  Widget _buildChoiceTile(BuildContext context, PhraseData data) {
    final isSelected = selectedValue == data;
    return ActionPhraseChip<PhraseData>(
      value: data,
      position: data.position,
      valueText: data.value,
      isSelected: isSelected,
      onPressed: handleItemSelected,
      hasIndex: true,
    );
  }

  void handleItemSelected(PhraseData value) {
    onSelected?.call(value);
  }
}
