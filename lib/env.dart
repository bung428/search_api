// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment(
      'DEFINE_APP_NAME', defaultValue: 'SearchApi'
  );
  static const APP_SUFFIX = String.fromEnvironment('DEFINE_APP_SUFFIX');
  static const _APP_MODE = String.fromEnvironment('DEFINE_APP_MODE');
  static const APP_MODE = _APP_MODE == 'simple'
      ? EnvironmentMode.simple : EnvironmentMode.clean;

  static bool isSimple = APP_MODE == EnvironmentMode.simple;
  static bool isClean = APP_MODE == EnvironmentMode.clean;
}

enum EnvironmentMode { simple, clean }