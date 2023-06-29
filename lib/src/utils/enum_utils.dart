import 'package:chain_wallet_mobile/src/extensions/extensions.dart';

class TranslatedEnum<TEnum> {
  TranslatedEnum(this.enumValue, this.translation);

  final TEnum enumValue;
  final String translation;
}

class EnumUtils {
  static List<TranslatedEnum<TEnum>> getTranslatedAndSortedEnum<TEnum>(
    List<TEnum> values,
    String Function(TEnum, int) itemText, {
    List<TEnum> exclude = const [],
    bool sort = true,
  }) {
    final filterValues = exclude.isNotEmpty
        ? values.where((el) => !exclude.contains(el))
        : values;
    final translatedValues = filterValues.mapIndex(
      (filter, index) {
        return TranslatedEnum<TEnum>(filter, itemText(filter, index));
      },
    ).toList();

    if (sort) {
      translatedValues.sort((x, y) => x.translation.compareTo(y.translation));
    }
    return translatedValues;
  }

  static List<TranslatedEnum<TEnum>> getTranslatedAndSortedEnumWithAll<TEnum>(
    TEnum allValue,
    String allValueText,
    List<TEnum> values,
    String Function(TEnum, int) itemText, {
    List<TEnum> exclude = const [],
    bool sort = true,
  }) {
    final filterValues = exclude.isNotEmpty
        ? values.where((el) => !exclude.contains(el))
        : values;
    final translatedValues = filterValues.mapIndex(
      (filter, index) {
        return TranslatedEnum<TEnum>(
          filter,
          filter == allValue ? allValueText : itemText(filter, index),
        );
      },
    ).toList();

    if (sort) {
      translatedValues.sort((x, y) => x.translation.compareTo(y.translation));
    }
    return translatedValues;
  }
}
