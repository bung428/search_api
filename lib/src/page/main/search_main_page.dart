import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/src/bloc/bloc_provider.dart';
import 'package:search_api/src/dependencies.dart';
import 'package:search_api/src/page/main/search_main_bloc.dart';
import 'package:search_api/src/route/app_links.dart';
import 'package:search_api/src/widget/box_widget.dart';
import 'package:search_api/src/widget/search_bar_widget.dart';
import 'package:search_api/src/widget/stream_builder_widget.dart';
import 'package:search_api/src/widget/topic_item_widget.dart';

class SearchMainPage extends BLoCProvider<SearchMainBLoC> {
  const SearchMainPage({super.key});

  @override
  SearchMainBLoC createBLoC() =>
      SearchMainBLoC(locator<ApiRepository>());

  @override
  Widget build(BuildContext context, SearchMainBLoC bloc) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SearchBarWidget(
                searchTxtCallback: bloc.getSearchTopics,
              ),
              const ColumnBox(12),
              Expanded(
                child: StreamBuilderWidget(
                  initialData: const <TopicItem>[],
                  nullWidget: const Center(
                    child: Text('No data found.'),
                  ),
                  stream: bloc.topicItemsStream,
                  builder: (context, List<TopicItem> items) {
                    return ListView(
                      children: items.map((e) => TopicItemWidget(
                        item: e,
                        onTap: () => context.goNamed(
                          AppLinks.detail.linkPath,
                          extra: e
                        ),
                      )).toList(),
                    );
                  }
                ),
              ),
              // TextButton(onPressed: () => context.go(AppLinks.detail.linkPath), child: Text('go to detail'))
            ],
          ),
        ),
      ),
    );
  }
}