// ignore_for_file: non_constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_topics_request.freezed.dart';
part 'search_topics_request.g.dart';

@freezed
class SearchTopicsRequest with _$SearchTopicsRequest {
  factory SearchTopicsRequest({
    ///keyWord
    required String q,
    @Default(30) int per_page,
    int? page
  }) = _SearchTopicsRequest;

  factory SearchTopicsRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchTopicsRequestFromJson(json);
}