import 'package:search_api/bloc/bloc_provider.dart';
import 'package:search_api/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/clean_arch/domain/repository/api_repository.dart';

class SearchMainController extends BLoC with BLoCStreamSubscription {
  final ApiRepository apiRepository;

  SearchMainController(this.apiRepository);

  SearchTopics? searchTopics;

  ///todo: onData 처리하고 다음 화면 마무리하기.
  ///커스텀 가능한 부분 찾기
  void getSearchTopics(String keyWord) {
    streamSubscription<SearchTopics?>(
      stream: Stream.fromFuture(apiRepository.getSearchTopics(
        request: SearchTopicsRequest(q: keyWord)
      )),
      onData: (topics) {
        if (topics == null) {
          print('KBG onData null');
        } else {
          print('KBG onData not null');
        }
      }
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}