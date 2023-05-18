import 'package:rxdart/rxdart.dart';
import 'package:search_api/architecture/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/topic_item.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/architecture/simple_arch/service/api/search.dart';
import 'package:search_api/src/bloc/bloc_provider.dart';

abstract class SearchMainBLoC extends BLoC with BLoCStreamSubscription {
  final topicItems = BehaviorSubject<List<TopicItem>>();
  Stream<List<TopicItem>> get topicItemsStream => topicItems.stream;

  void getSearchTopics(String keyWord);

  @override
  void dispose() {
    topicItems.close();
  }
}

class SearchMainCleanBLoC extends SearchMainBLoC {
  final ApiRepository apiRepository;

  SearchMainCleanBLoC(this.apiRepository);

  @override
  void getSearchTopics(String keyWord) {
    streamSubscription<SearchTopics?>(
        stream: Stream.fromFuture(apiRepository.getSearchTopics(
            request: SearchTopicsRequest(q: keyWord)
        )),
        onData: (topics) {
          if (topics != null) {
            topicItems.value = topics.items;
          }
        }
    );
  }
}

class SearchMainSimpleBLoC extends SearchMainBLoC {
  @override
  void getSearchTopics(String keyWord) async {
    final topics = await SearchApi.instance.getSearchTopics(keyWord);
    if (topics != null) {
      topicItems.value = topics.items;
    }
  }
}