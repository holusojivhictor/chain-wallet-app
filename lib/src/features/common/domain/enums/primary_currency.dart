enum PrimaryCurrency {
  native('Native'),
  fiat('Fiat');

  const PrimaryCurrency(this.translate);

  final String translate;
}
