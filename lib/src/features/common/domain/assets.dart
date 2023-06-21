class Assets {
  const Assets._();

  static String svgsBasePath = 'assets/svgs';
  static String imagesBasePath = 'assets/images';
  static String riveBasePath = 'assets/rive';

  static String getSvgPath(String name) => '$svgsBasePath/$name';
  static String getImagePath(String name) => '$imagesBasePath/$name';
  static String getRivePath(String name) => '$riveBasePath/$name';
}
