extension DoubleExtensions on double? {
  String fixed(int digits) {
    if (this != null) {
      return this == 0 ? '0' : this!.toStringAsFixed(digits);
    }
    return '0';
  }
}
