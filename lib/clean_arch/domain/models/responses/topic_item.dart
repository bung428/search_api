import 'package:freezed_annotation/freezed_annotation.dart';

part 'topic_item.freezed.dart';
part 'topic_item.g.dart';

@freezed
class TopicItem with _$TopicItem {
  factory TopicItem({
    String? display_name,
    required String name,
    required String? short_description,
    required String? description,
    required String? created_by,
    required String? released,
    required String created_at,
    required String updated_at,
    required bool featured,
    required bool curated,
    required double score,
  }) = _TopicItem;

  factory TopicItem.fromJson(Map<String, dynamic> json) =>
      _$TopicItemFromJson(json);
}