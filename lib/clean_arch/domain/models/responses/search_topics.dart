import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:search_api/clean_arch/domain/models/responses/topic_item.dart';

part 'search_topics.freezed.dart';
part 'search_topics.g.dart';

@freezed
class SearchTopics with _$SearchTopics {
  factory SearchTopics({
    required int total_count,
    required bool incomplete_results,
    required List<TopicItem> items,
  }) = _SearchTopics;

  factory SearchTopics.fromJson(Map<String, dynamic> json) =>
      _$SearchTopicsFromJson(json);
}