import 'package:dio/dio.dart';
import 'package:search_api/architecture/clean_arch/domain/models/api_response.dart';
import 'package:search_api/architecture/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/architecture/clean_arch/domain/models/responses/search_topics.dart';

const get = 'GET';
const topicsPoint = '/topics';
const apiUrl = 'https://api.github.com/search';

abstract class TopicsApiService {
  factory TopicsApiService(Dio dio, {String baseUrl}) = _TopicsApiService;

  Future<HttpResponse<SearchTopics>> getTopics({required SearchTopicsRequest request});
}

class _TopicsApiService implements TopicsApiService {
  _TopicsApiService(
      this._dio, {
        this.baseUrl,
      }) {
    baseUrl ??= apiUrl;
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<SearchTopics>> getTopics({required SearchTopicsRequest request}) async {
      const extra = <String, dynamic>{};
      final queryParameters = request.toJson();
      queryParameters.removeWhere((k, v) => v == null);
      final headers = <String, dynamic>{};
      final data = <String, dynamic>{};
      final result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<Response<SearchTopics>>(Options(
            method: get,
            headers: headers,
            extra: extra,
          )
              .compose(
            _dio.options,
            topicsPoint,
            queryParameters: queryParameters,
            data: data,
          )
              .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

      final value = SearchTopics.fromJson(result.data!);
      final httpResponse = HttpResponse(value, result);

      return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}