import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:search_api/exception.dart';
import 'package:search_api/standard/service/dio_service.dart';

class SearchApi {
  static final SearchApi _instance = SearchApi._();

  static SearchApi get instance => _instance;

  SearchApi._();

  final _dio =
  Dio(BaseOptions(baseUrl: 'https://api.github.com/search'));

  void init() {
    _dio.interceptors.add(DioService.logInterceptorsWrapper);
  }

  void checkRespStatus(int? statusCode) {
    if (statusCode == null) {
      return;
    }

    try {

    } on NotModifiedException catch (_) {
      Fluttertoast.showToast(msg: _.toString());
    }
  }

  Future<void> getSearchTopics(String keyWord) async {
    // List results = [];

    final res = await _dio.get('/topics?q=$keyWord');
    final statusCode = res.statusCode;
    if (statusCode == null) {
      return;
    }

    try {
      // Map<String, dynamic> topics = res.data;
      // if (topics.isNotEmpty) {
      //   for (Map<String, dynamic> topic in topics) {
      //     try {
      //       // results.add();
      //     } catch (_) {
      //       print('getSearchTopics error: $_');
      //     }
      //   }
      // }
    } on NotModifiedException catch (_) {
      Fluttertoast.showToast(msg: _.toString());
    }

    // return results;
  }
}