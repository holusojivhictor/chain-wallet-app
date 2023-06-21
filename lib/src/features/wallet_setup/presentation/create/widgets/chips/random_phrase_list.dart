import 'package:chain_wallet_mobile/src/features/wallet_setup/domain/models/models.dart';
import 'package:chain_wallet_mobile/src/features/wallet_setup/presentation/create/widgets/chips/action_phrase_chip.dart';
import 'package:flutter/material.dart';

class RandomPhraseList extends StatelessWidget {
  const RandomPhraseList({
    required this.values,
    required this.selectedValue,
    super.key,
    this.onSelected,
  });

  final Phrase selectedValue;
  final List<Phrase> values;
  final void Function(Phrase)? onSelected;

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

  Widget _buildChoiceTile(BuildContext context, Phrase data) {
    final isSelected = selectedValue == data;
    return ActionPhraseChip<Phrase>(
      value: data,
      position: data.position,
      valueText: data.value,
      isSelected: isSelected,
      onPressed: handleItemSelected,
      hasIndex: true,
    );
  }

  void handleItemSelected(Phrase value) {
    onSelected?.call(value);
  }
}
