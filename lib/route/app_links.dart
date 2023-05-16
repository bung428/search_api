import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/page/search_detail_page.dart';
import 'package:search_api/page/search_main_page.dart';

abstract class Links {
  String get linkPath;
}

enum AppLinks implements Links {
  search('/'),
  detail('/detail'),
  ;

  @override
  final String linkPath;

  const AppLinks(this.linkPath);
}

extension AppLinksRoute on AppLinks {
  GoRoute getRoute({String? name, String? path}) {
    switch (this) {
      case AppLinks.search:
        return GoRoute(
          name: name,
          path: path ?? linkPath,
          pageBuilder: (
            context,
            state,
          ) {
            return MaterialPage(
                key: state.pageKey,
                name: state.location,
                arguments: state.extra,
                child: SearchMainPage());
          },
        );
      case AppLinks.detail:
        return GoRoute(
          name: name,
          path: path ?? linkPath,
          pageBuilder: (
            context,
            state,
          ) {
            return MaterialPage(
                key: state.pageKey,
                name: state.location,
                arguments: state.extra,
                child: const SearchDetailPage());
          },
        );
    }
  }
}
