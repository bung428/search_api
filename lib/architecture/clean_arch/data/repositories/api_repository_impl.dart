import 'package:search_api/architecture/clean_arch/data/datasources/remote/topics_api_service.dart';
import 'package:search_api/architecture/clean_arch/data/repositories/base_api_repository.dart';
import 'package:search_api/architecture/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository with ApiRepository {
  final TopicsApiService topicsApiService;

  ApiRepositoryImpl(this.topicsApiService);

  @override
  Future<SearchTopics?> getSearchTopics({required SearchTopicsRequest request}) {
    return getStateOf<SearchTopics>(
      request: () => topicsApiService.getTopics(request: request),
    );
  }
}
