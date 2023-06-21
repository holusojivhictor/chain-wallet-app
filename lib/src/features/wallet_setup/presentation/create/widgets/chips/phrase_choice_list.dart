import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/chips/action_phrase_chip.dart';
import 'package:flutter/material.dart';

class PhraseChoiceList extends StatelessWidget {
  const PhraseChoiceList({
    required this.values,
    super.key,
    this.selectedValues = const [],
    this.onSelected,
  });

  final List<Phrase> selectedValues;
  final List<Phrase> values;
  final void Function(Phrase)? onSelected;

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

  Widget _buildChoiceTile(BuildContext context, Phrase data) {
    final isSelected =
        selectedValues.isNotEmpty && selectedValues.contains(data);
    return ActionPhraseChip<Phrase>(
      value: data,
      position: data.position,
      valueText: data.value,
      isSelected: isSelected,
      onPressed: handleItemSelected,
      hasIndex: false,
    );
  }

  void handleItemSelected(Phrase value) {
    onSelected?.call(value);
  }
}
