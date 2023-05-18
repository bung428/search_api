// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_topics_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchTopicsRequest _$$_SearchTopicsRequestFromJson(
        Map<String, dynamic> json) =>
    _$_SearchTopicsRequest(
      q: json['q'] as String,
      per_page: json['per_page'] as int?,
      page: json['page'] as int?,
    );

Map<String, dynamic> _$$_SearchTopicsRequestToJson(
        _$_SearchTopicsRequest instance) =>
    <String, dynamic>{
      'q': instance.q,
      'per_page': instance.per_page,
      'page': instance.page,
    };
