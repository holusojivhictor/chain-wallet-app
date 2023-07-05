import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';

typedef RadioItemText<T> = String Function(T value, int index);

class SettingsRadioTile<TEnum> extends StatelessWidget {
  const SettingsRadioTile({
    required this.selectedValue,
    required this.values,
    required this.itemText,
    super.key,
    this.onSelected,
    this.exclude = const [],
    this.sort = false,
  });

  final TEnum selectedValue;
  final List<TEnum> values;
  final List<TEnum> exclude;
  final void Function(TEnum)? onSelected;
  final RadioItemText<TEnum> itemText;
  final bool sort;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: radioItems(
        EnumUtils.getTranslatedAndSortedEnum<TEnum>(
          values,
          itemText,
          exclude: exclude,
          sort: sort,
        ),
      ),
    );
  }

  List<RadioRow<TEnum>> radioItems(
    List<TranslatedEnum<TEnum>> translated,
  ) {
    return translated.map((e) {
      return RadioRow(
        value: e.enumValue,
        selectedValue: selectedValue,
        valueText: e.translation,
        onChanged: handleItemSelected,
      );
    }).toList();
  }

  void handleItemSelected(TEnum? value) {
    if (value != null) onSelected?.call(value);
  }
}

class RadioRow<T> extends StatelessWidget {
  const RadioRow({
    required this.value,
    required this.selectedValue,
    required this.valueText,
    super.key,
    this.onChanged,
  });

  final T value;
  final T selectedValue;
  final String valueText;
  final void Function(T?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: selectedValue,
            onChanged: onChanged,
            visualDensity: const VisualDensity(
              horizontal: -4,
              vertical: -4,
            ),
          ),
          const SizedBox(width: 3),
          Text(valueText),
        ],
      ),
    );
  }
}
