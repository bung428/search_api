import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:search_api/clean_arch/data/datasources/remote/topics_api_service.dart';
import 'package:search_api/clean_arch/data/repositories/api_repository_impl.dart';
import 'package:search_api/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/standard/api/search.dart';
import 'package:search_api/standard/service/dio_service.dart';

final locator = GetIt.instance;
const base = 'https://api.github.com/search';

Future<void> initDependencies() async {
  SearchApi.instance.init();

  final dio = Dio();
  dio.interceptors.add(DioService.logInterceptorsWrapper);

  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<TopicsApiService>(
    TopicsApiService(locator<Dio>(), baseUrl: base)
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<TopicsApiService>()),
  );
}