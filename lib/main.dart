import 'package:flutter/material.dart';
import 'package:search_api/src/dependencies.dart';
import 'package:search_api/src/route/app_router.dart';

void main() async {
  await initDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Search API',
      routerConfig: appRouter,
      theme: ThemeData(

      ),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
