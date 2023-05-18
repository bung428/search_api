import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/route/app_links.dart';

import '../page/search_main_page.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();

GoRouter get appRouter => GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: appNavigatorKey,
  routes: [
    GoRoute(
      name: AppLinks.search.linkPath,
      path: AppLinks.search.linkPath,
      pageBuilder: (
          context,
          state,
          ) {
        return MaterialPage(
            key: state.pageKey,
            name: state.location,
            arguments: state.extra,
            child: const SearchMainPage());
      },
      routes: [
        AppLinks.detail.getRoute(),
      ]
    ),
  ],
);