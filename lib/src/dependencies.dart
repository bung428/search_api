import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:search_api/architecture/clean_arch/data/datasources/remote/topics_api_service.dart';
import 'package:search_api/architecture/clean_arch/data/repositories/api_repository_impl.dart';
import 'package:search_api/architecture/clean_arch/domain/repository/api_repository.dart';
import 'package:search_api/architecture/simple_arch/service/api/search.dart';
import 'package:search_api/architecture/simple_arch/service/dio_service.dart';
import 'package:search_api/env.dart';

final locator = GetIt.instance;
const base = 'https://api.github.com/search';

Future<void> initDependencies() async {
  switch (EnvironmentConfig.APP_MODE) {
    case EnvironmentMode.simple:
      SearchApi.instance.init();
      break;
    case EnvironmentMode.clean:
      final dio = Dio();
      dio.interceptors.add(DioService.logInterceptorsWrapper);

      locator.registerSingleton<Dio>(dio);

      locator.registerSingleton<TopicsApiService>(
          TopicsApiService(locator<Dio>(), baseUrl: base)
      );

      locator.registerSingleton<ApiRepository>(
        ApiRepositoryImpl(locator<TopicsApiService>()),
      );
      break;
  }
}