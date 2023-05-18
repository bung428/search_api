import 'package:dio/dio.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/architecture/simple_arch/service/dio_service.dart';

class SearchApi {
  static final SearchApi _instance = SearchApi._();

  static SearchApi get instance => _instance;

  SearchApi._();

  final _dio =
  Dio(BaseOptions(baseUrl: 'https://api.github.com/search'));

  void init() {
    _dio.interceptors.add(DioService.logInterceptorsWrapper);
  }

  Future<SearchTopics?> getSearchTopics(String keyWord) async {
    final res = await _dio.get('/topics?q=$keyWord');

    if (res.data == null) {
      return null;
    }
    return SearchTopics.fromJson(res.data!);
  }
}