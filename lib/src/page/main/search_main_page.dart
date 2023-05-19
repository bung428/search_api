import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/env.dart';
import 'package:search_api/src/bloc/bloc_provider.dart';
import 'package:search_api/src/dependencies.dart';
import 'package:search_api/src/page/main/search_main_bloc.dart';
import 'package:search_api/src/route/app_links.dart';
import 'package:search_api/src/widget/app_bar_stream_widget.dart';
import 'package:search_api/src/widget/load_more_listview.dart';
import 'package:search_api/src/widget/search_bar_widget.dart';
import 'package:search_api/src/widget/stream_builder_widget.dart';
import 'package:search_api/src/widget/topic_item_widget.dart';

const noData = 'No data found.';

class SearchMainPage extends BLoCProvider<SearchMainBLoC> {
  const SearchMainPage({super.key});

  @override
  SearchMainBLoC createBLoC() => EnvironmentConfig.isClean
      ? SearchMainCleanBLoC(locator<ApiRepository>())
      : SearchMainSimpleBLoC();

  @override
  Widget build(BuildContext context, SearchMainBLoC bloc) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBarStream(
        appbar: StreamBuilderWidget<AppBarMode>(
          stream: bloc.appBarModeStream,
          builder: (context, AppBarMode mode) {
            return _buildAppBar(context, mode, bloc);
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: StreamBuilderWidget(
            initialData: const <TopicItem>[],
            nullWidget: const Center(
              child: Text(noData),
            ),
            stream: bloc.topicItemsStream,
            builder: (context, List<TopicItem> items) {
              return LoadMoreListViewWidget(
                list: items,
                onLoadMoreCallback: bloc.loadMore,
                sliverListWidget: SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return TopicItemWidget(
                        item: items[index],
                        onTap: () => context.goNamed(AppLinks.detail.linkPath,
                            extra: items[index]),
                      );
                    },
                    childCount: items.length,
                  )),
                  moreWidget: Container(
                  alignment: AlignmentDirectional.center,
                  child: const CircularProgressIndicator(color: Colors.black,),
                ),
              );
            }
          ),
        ),
      ),
    );
  }
  
  Widget _buildAppBar(BuildContext context, AppBarMode mode, SearchMainBLoC bloc) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    
    Widget child;
    switch (mode) {
      case AppBarMode.search:
        child = AppBar(
          backgroundColor: Colors.white,
          title: SearchBarWidget(
            searchTxtCallback: bloc.getSearchTopics,
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black,),
              onPressed: () => bloc.switchAppBar(mode),
            )
          ],
        );
        break;
      case AppBarMode.general:
        child = AppBar(
          backgroundColor: Colors.white,
          title: Text(EnvironmentConfig.APP_NAME, style: textTheme.titleLarge,),
          actions: [
            IconButton(
              icon: const Icon(Icons.search, color: Colors.black,),
              onPressed: () => bloc.switchAppBar(mode),
            )
          ],
        );
        break;
    }
    return AnimatedSwitcher(
      duration: const Duration(seconds: 1),
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child,);
      },
      child: child,
    ); 
  }
}