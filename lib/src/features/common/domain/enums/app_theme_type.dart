enum AppThemeType {
  light,
  dark;

  String get translate {
    switch(this) {
      case AppThemeType.light:
        return 'Light';
      case AppThemeType.dark:
        return 'Dark';
    }
  }
}
