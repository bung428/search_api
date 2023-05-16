import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/route/app_links.dart';

final appNavigatorKey = GlobalKey<NavigatorState>();

GoRouter get appRouter => GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: appNavigatorKey,
  routes: [
    AppLinks.search.getRoute(),
    AppLinks.detail.getRoute(),
  ],
);