class PhraseData {
  final int position;
  String value;

  PhraseData({
    required this.position,
    this.value = '',
  });

  void changeValue(String newValue) => value = newValue;
}
