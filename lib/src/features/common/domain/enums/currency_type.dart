enum CurrencyType {
  usd,
  usdc;

  String get translate {
    switch(this) {
      case CurrencyType.usd:
        return 'USD - United States Dollar';
      case CurrencyType.usdc:
        return 'USDC - USD Coin';
    }
  }
}
