extension DoubleExtensions on double {
  String fixed(int digits) => this == 0 ? '0' : toStringAsFixed(digits);
}
