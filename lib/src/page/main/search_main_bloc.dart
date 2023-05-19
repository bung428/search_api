import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:search_api/architecture/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/architecture/simple_arch/service/api/search.dart';
import 'package:search_api/src/bloc/bloc_provider.dart';

enum AppBarMode {search, general}

abstract class SearchMainBLoC extends BLoC with BLoCStreamSubscription {
  String keyWord = '';
  final ScrollController scrollController = ScrollController();

  final topicItems = BehaviorSubject<List<TopicItem>>()..value = [];
  Stream<List<TopicItem>> get topicItemsStream => topicItems.stream;

  final appBarMode = BehaviorSubject<AppBarMode>()..value = AppBarMode.general;
  Stream<AppBarMode> get appBarModeStream => appBarMode.stream;

  @override
  void onBLoCLaunched() {
    scrollController.addListener(loadMore);
  }

  @override
  void dispose() {
    scrollController.removeListener(loadMore);

    topicItems.close();
    appBarMode.close();
  }

  void getSearchTopics(String keyWord);

  Future<List<TopicItem>> fetch(String keyWord);

  Future<void> loadMore();

  int getQuotient() {
    final searchTopics = topicItems.hasValue ? topicItems.value : [];
    int quotient = 0;
    if (searchTopics.isNotEmpty) {
      quotient = searchTopics.length ~/ 30;
      if (quotient > 0) {
        quotient += 1;
      }
    }

    return quotient + 1;
  }

  void switchAppBar(AppBarMode mode) {
    switch (mode) {
      case AppBarMode.search:
        appBarMode.value = AppBarMode.general;
        break;
      case AppBarMode.general:
        appBarMode.value = AppBarMode.search;
        break;
    }
  }
}

class SearchMainCleanBLoC extends SearchMainBLoC {
  final ApiRepository apiRepository;

  SearchMainCleanBLoC(this.apiRepository);

  @override
  void getSearchTopics(String keyWord) async {
    this.keyWord = keyWord;
    final result = await fetch(keyWord);

    topicItems.value = result;
  }

  @override
  Future<List<TopicItem>> fetch(String keyWord) {
    final completer = Completer<List<TopicItem>>();
    streamSubscription<SearchTopics?>(
        stream: Stream.fromFuture(apiRepository.getSearchTopics(
            request: SearchTopicsRequest(q: keyWord, page: getQuotient())
        )),
        onData: (topics) {
          if (topics != null) {
            completer.complete(topics.items);
          }
        }
    );
    return completer.future;
  }

  @override
  Future<void> loadMore() async {
    final result = await fetch(keyWord);
    topicItems.value = [...topicItems.value, ...result];
  }
}

class SearchMainSimpleBLoC extends SearchMainBLoC {
  @override
  void getSearchTopics(String keyWord) async {
    this.keyWord = keyWord;
    final result = await fetch(keyWord);

    topicItems.value = result;
  }

  @override
  Future<List<TopicItem>> fetch(String keyWord) async {
    final topics = await SearchApi.instance.getSearchTopics(
        keyWord, pageNum: getQuotient()
    );
    return topics?.items ?? [];
  }

  @override
  Future<void> loadMore() async {
    final result = await fetch(keyWord);
    topicItems.value = [...topicItems.value, ...result];
  }
}