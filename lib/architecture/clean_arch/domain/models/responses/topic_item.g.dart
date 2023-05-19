// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TopicItem _$$_TopicItemFromJson(Map<String, dynamic> json) => _$_TopicItem(
      display_name: json['display_name'] as String?,
      short_description: json['short_description'] as String?,
      description: json['description'] as String?,
      created_by: json['created_by'] as String?,
      released: json['released'] as String?,
      name: json['name'] as String,
      created_at: json['created_at'] as String,
      updated_at: json['updated_at'] as String,
      featured: json['featured'] as bool,
      curated: json['curated'] as bool,
      score: (json['score'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TopicItemToJson(_$_TopicItem instance) =>
    <String, dynamic>{
      'display_name': instance.display_name,
      'short_description': instance.short_description,
      'description': instance.description,
      'created_by': instance.created_by,
      'released': instance.released,
      'name': instance.name,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'featured': instance.featured,
      'curated': instance.curated,
      'score': instance.score,
    };
