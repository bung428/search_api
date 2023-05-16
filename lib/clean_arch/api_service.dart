import 'package:dio/dio.dart';
import 'package:search_api/clean_arch/data/datasources/remote/topics_api_service.dart';
import 'package:search_api/standard/service/dio_service.dart';

class ApiService {
  static final ApiService _instance = ApiService._();

  static ApiService get instance => _instance;

  ApiService._();

  final _dio =
  Dio(BaseOptions(baseUrl: 'https://api.github.com/search'));

  void init() {
    _dio.interceptors.add(DioService.logInterceptorsWrapper);
  }
}