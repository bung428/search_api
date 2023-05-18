import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/src/page/detail/search_detail_page.dart';
import 'package:search_api/src/page/main/search_main_page.dart';

abstract class Links {
  String get linkPath;
}

enum AppLinks implements Links {
  search('/'),
  detail('detail'),
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
          name: name ?? linkPath,
          path: path ?? linkPath,
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
        );
      case AppLinks.detail:
        return GoRoute(
          name: name ?? linkPath,
          path: path ?? linkPath,
          pageBuilder: (
            context,
            state,
          ) {
            return MaterialPage(
                key: state.pageKey,
                name: state.location,
                arguments: state.extra,
                child: SearchDetailPage(item: state.extra as TopicItem,));
          },
        );
    }
  }
}
