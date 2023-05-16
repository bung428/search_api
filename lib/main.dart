import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search_api/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/dependencies.dart';
import 'package:search_api/page/search_main_controller.dart';
import 'package:search_api/route/app_router.dart';

void main() async {
  await initDependencies();

  runApp(const MyApp());
  // runApp(MultiProvider(
  //   providers: [
  //     ChangeNotifierProvider(
  //         create: (_) => SearchMainController(locator<ApiRepository>())
  //     ),
  //   ],
  //   child: const MyApp(),
  // ),);
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
