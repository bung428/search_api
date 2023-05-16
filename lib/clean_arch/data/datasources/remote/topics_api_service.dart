import 'package:dio/dio.dart';
import 'package:search_api/clean_arch/domain/models/api_response.dart';
import 'package:search_api/clean_arch/domain/models/requests/search_topics_request.dart';
import 'package:search_api/clean_arch/domain/models/responses/search_topics.dart';

abstract class TopicsApiService {
  factory TopicsApiService(Dio dio, {String baseUrl}) = _TopicsApiService;

  Future<HttpResponse<SearchTopics>> getTopics({required SearchTopicsRequest request});
}

class _TopicsApiService implements TopicsApiService {
  _TopicsApiService(
      this._dio, {
        this.baseUrl,
      }) {
    baseUrl ??= 'https://api.github.com/search';
  }

  final Dio _dio;

  String? baseUrl;

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

  @override
  Future<HttpResponse<SearchTopics>> getTopics({required SearchTopicsRequest request}) async {
      const _extra = <String, dynamic>{};
      final queryParameters = request.toJson();
      queryParameters.removeWhere((k, v) => v == null);
      final _headers = <String, dynamic>{};
      final _data = <String, dynamic>{};
      final _result = await _dio.fetch<Map<String, dynamic>>(
          _setStreamType<Response<SearchTopics>>(Options(
            method: 'GET',
            headers: _headers,
            extra: _extra,
          )
              .compose(
            _dio.options,
            '/topics',
            queryParameters: queryParameters,
            data: _data,
          )
              .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));

      final value = SearchTopics.fromJson(_result.data!);
      final httpResponse = HttpResponse(value, _result);

      return httpResponse;
  }
}