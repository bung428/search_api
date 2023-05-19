import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';
import 'package:search_api/architecture/simple_arch/service/dio_service.dart';

const apiUrl = 'https://api.github.com/search';

class SearchApi {
  static final SearchApi _instance = SearchApi._();

  static SearchApi get instance => _instance;

  SearchApi._();

  final _dio = Dio(BaseOptions(baseUrl: apiUrl));

  void init() {
    _dio.interceptors.add(DioService.logInterceptorsWrapper);
  }

  Future<SearchTopics?> getSearchTopics(String keyWord,
      {int pageNum = 1, int perPage = 30}) async {
    try {
      final res = await _dio.get('/topics?q=$keyWord&page=$pageNum');

      if (res.data == null) {
        return null;
      }
      return SearchTopics.fromJson(res.data!);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    return null;
  }
}