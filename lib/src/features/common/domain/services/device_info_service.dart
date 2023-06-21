/// The class controlling the device info services. Access the app name, version and device models.
abstract class DeviceInfoService {
  /// Get the user's device info.
  ///
  /// In the form,
  /// ```dart
  /// Model: 'N/A',
  /// OsVersion: 'N/A',
  /// AppVersion: 'N/A'
  Map<String, String> get deviceInfo;

  /// Get the app's package name.
  String get appName;

  /// Get the app's current version.
  String get version;

  /// Get the app's current version and build number.
  String get versionWithBuildNumber;

  /// Whether the app build or version has changed.
  bool get versionChanged;

  /// Initialize package and device info tracking.
  Future<void> init();
}
