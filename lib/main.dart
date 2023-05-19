// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:search_api/env.dart';
import 'package:search_api/src/dependencies.dart';
import 'package:search_api/src/route/app_router.dart';

void main() async {
  print('APP_NAME : ${EnvironmentConfig.APP_NAME} APP_SUFFIX : ${EnvironmentConfig
      .APP_SUFFIX} APP_MODE : ${EnvironmentConfig.APP_MODE}');

  Environment.newInstance(EnvironmentConfig.APP_MODE).run();
}

class Environment {
  static Environment? _instance;
  static Environment? get instance => _instance;

  final EnvironmentMode _buildType;
  static EnvironmentMode get buildType => instance!._buildType;

  const Environment._internal(this._buildType);

  factory Environment.newInstance(EnvironmentMode mode) {
    _instance ??= Environment._internal(mode);
    return _instance!;
  }

  bool get isSimple => _buildType == EnvironmentMode.simple;

  void run() async {
    await initDependencies();

    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Search API',
      routerConfig: appRouter,
      theme: ThemeData(),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
