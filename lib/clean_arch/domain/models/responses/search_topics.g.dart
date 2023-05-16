// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_topics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SearchTopics _$$_SearchTopicsFromJson(Map<String, dynamic> json) =>
    _$_SearchTopics(
      total_count: json['total_count'] as int,
      incomplete_results: json['incomplete_results'] as bool,
      items: (json['items'] as List<dynamic>)
          .map((e) => TopicItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SearchTopicsToJson(_$_SearchTopics instance) =>
    <String, dynamic>{
      'total_count': instance.total_count,
      'incomplete_results': instance.incomplete_results,
      'items': instance.items,
    };
