import 'package:chain_wallet_mobile/src/features/settings/presentation/widgets/popup/popup.dart';
import 'package:chain_wallet_mobile/src/utils/utils.dart';
import 'package:flutter/material.dart';

typedef PopupItemText<T> = String Function(T value, int index);

class ItemPopupFilter<TEnum> extends StatelessWidget {
  const ItemPopupFilter({
    required this.child,
    required this.title,
    required this.selectedValue,
    required this.values,
    required this.itemText,
    super.key,
    this.onSelected,
    this.exclude = const [],
  });

  final String title;
  final TEnum selectedValue;
  final void Function(TEnum)? onSelected;
  final List<TEnum> values;
  final List<TEnum> exclude;
  final PopupItemText<TEnum> itemText;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopupButton<TEnum>(
      tooltip: title,
      title: title,
      initialValue: selectedValue,
      onSelected: handleItemSelected,
      itemBuilder: (context) {
        return dialogItems(
          EnumUtils.getTranslatedAndSortedEnum<TEnum>(
            values,
            itemText,
            exclude: exclude,
          ),
        );
      },
      child: child,
    );
  }

  List<CheckedPopupItem<TEnum>> dialogItems(
    List<TranslatedEnum<TEnum>> translated,
  ) {
    return translated.map(
      (e) {
        return CheckedPopupItem<TEnum>(
          checked: selectedValue == e.enumValue,
          value: e.enumValue,
          child: Text(e.translation),
        );
      },
    ).toList();
  }

  void handleItemSelected(TEnum value) {
    onSelected?.call(value);
  }
}
