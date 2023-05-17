import 'package:chain_wallet_mobile/domain/models/models.dart';
import 'package:flutter/material.dart';

import 'action_phrase_chip.dart';

class PhraseChoiceList extends StatelessWidget {
  final List<PhraseData> selectedValues;
  final List<PhraseData> values;
  final Function(PhraseData)? onSelected;

  const PhraseChoiceList({
    Key? key,
    required this.values,
    this.selectedValues = const [],
    this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 20,
      runSpacing: 16,
      children: getChoices(context),
    );
  }

  List<Widget> getChoices(BuildContext context) {
    return values.map((e) => _buildChoiceTile(context, e)).toList();
  }

  Widget _buildChoiceTile(BuildContext context, PhraseData data) {
    final isSelected = selectedValues.isNotEmpty && selectedValues.contains(data);
    return ActionPhraseChip<PhraseData>(
      value: data,
      position: data.position,
      valueText: data.value,
      isSelected: isSelected,
      onPressed: handleItemSelected,
      hasIndex: false,
    );
  }

  void handleItemSelected(PhraseData value) {
    onSelected?.call(value);
  }
}
