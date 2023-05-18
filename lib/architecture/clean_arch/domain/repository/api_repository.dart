import 'package:search_api/architecture/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';

abstract class ApiRepository {
  Future<SearchTopics?> getSearchTopics({
    required SearchTopicsRequest request,
  });
}