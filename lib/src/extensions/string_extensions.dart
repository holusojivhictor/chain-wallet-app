extension StringExtensions on String {
  /// A simple placeholder that can be used to search all the hardcoded strings
  /// in the code (useful to identify strings that need to be localized).
  String get hardcoded => this;

  String get short =>
      '''${substring(0, length ~/ 4)}...${substring(length - 4)}''';

  String truncate({int digits = 2}) {
    return double.parse(this).toStringAsFixed(digits);
  }
}

extension OptionalStringExtensions on String? {
  bool get isNullOrEmpty =>
      this == null || this!.isEmpty || this!.trim().isEmpty;
  bool get isNotNullNorEmpty => !isNullOrEmpty;

  bool get isNullOrEmptyOrHasNull =>
      this == null || this!.isEmpty || this!.contains('null');
  bool get isNotNullNorEmptyNorHasNull => !isNullOrEmptyOrHasNull;

  bool isValidLength({int minLength = 0, int maxLength = 255}) =>
      isNotNullNorEmpty || this!.length > maxLength || this!.length < minLength;
}
