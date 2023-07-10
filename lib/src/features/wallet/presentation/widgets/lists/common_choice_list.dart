import 'package:chain_wallet_mobile/src/features/wallet/presentation/widgets/tiles/tiles.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';

typedef ChoiceText<T> = String Function(T value, int index);

class CommonChoiceList<TEnum> extends StatelessWidget {
  const CommonChoiceList({
    required this.selectedValue,
    required this.values,
    required this.choiceText,
    super.key,
    this.onSelected,
    this.exclude = const [],
    this.sort = false,
  });

  final TEnum selectedValue;
  final List<TEnum> values;
  final void Function(TEnum)? onSelected;
  final List<TEnum> exclude;
  final ChoiceText<TEnum> choiceText;
  final bool sort;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: choices(
        EnumUtils.getTranslatedAndSortedEnum<TEnum>(
          values,
          choiceText,
          exclude: exclude,
          sort: sort,
        ),
      ),
    );
  }

  List<Widget> choices(
    List<TranslatedEnum<TEnum>> translatedValues,
  ) {
    return translatedValues
        .map((e) => _buildChoiceTile(e.enumValue, e.translation))
        .toList();
  }

  Widget _buildChoiceTile(
    TEnum value,
    String valueText,
  ) {
    return CommonChoiceTile<TEnum>(
      value: value,
      isSelected: selectedValue == value,
      valueText: valueText,
      onPressed: handleItemSelected,
    );
  }

  void handleItemSelected(TEnum value) {
    onSelected?.call(value);
  }
}
