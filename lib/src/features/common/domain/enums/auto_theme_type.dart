enum AutoThemeModeType {
  on,
  off;

  bool get system {
    switch(this) {
      case AutoThemeModeType.on:
        return true;
      case AutoThemeModeType.off:
        return false;
    }
  }

  static AutoThemeModeType translate({required bool value}) {
    switch (value) {
      case false:
        return AutoThemeModeType.off;
      case true:
        return AutoThemeModeType.on;
    }
  }
}
