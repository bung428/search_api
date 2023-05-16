// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_topics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchTopics _$SearchTopicsFromJson(Map<String, dynamic> json) {
  return _SearchTopics.fromJson(json);
}

/// @nodoc
mixin _$SearchTopics {
  int get total_count => throw _privateConstructorUsedError;
  bool get incomplete_results => throw _privateConstructorUsedError;
  List<TopicItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchTopicsCopyWith<SearchTopics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTopicsCopyWith<$Res> {
  factory $SearchTopicsCopyWith(
          SearchTopics value, $Res Function(SearchTopics) then) =
      _$SearchTopicsCopyWithImpl<$Res, SearchTopics>;
  @useResult
  $Res call({int total_count, bool incomplete_results, List<TopicItem> items});
}

/// @nodoc
class _$SearchTopicsCopyWithImpl<$Res, $Val extends SearchTopics>
    implements $SearchTopicsCopyWith<$Res> {
  _$SearchTopicsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_count = null,
    Object? incomplete_results = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      total_count: null == total_count
          ? _value.total_count
          : total_count // ignore: cast_nullable_to_non_nullable
              as int,
      incomplete_results: null == incomplete_results
          ? _value.incomplete_results
          : incomplete_results // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TopicItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchTopicsCopyWith<$Res>
    implements $SearchTopicsCopyWith<$Res> {
  factory _$$_SearchTopicsCopyWith(
          _$_SearchTopics value, $Res Function(_$_SearchTopics) then) =
      __$$_SearchTopicsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total_count, bool incomplete_results, List<TopicItem> items});
}

/// @nodoc
class __$$_SearchTopicsCopyWithImpl<$Res>
    extends _$SearchTopicsCopyWithImpl<$Res, _$_SearchTopics>
    implements _$$_SearchTopicsCopyWith<$Res> {
  __$$_SearchTopicsCopyWithImpl(
      _$_SearchTopics _value, $Res Function(_$_SearchTopics) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total_count = null,
    Object? incomplete_results = null,
    Object? items = null,
  }) {
    return _then(_$_SearchTopics(
      total_count: null == total_count
          ? _value.total_count
          : total_count // ignore: cast_nullable_to_non_nullable
              as int,
      incomplete_results: null == incomplete_results
          ? _value.incomplete_results
          : incomplete_results // ignore: cast_nullable_to_non_nullable
              as bool,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<TopicItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchTopics implements _SearchTopics {
  _$_SearchTopics(
      {required this.total_count,
      required this.incomplete_results,
      required final List<TopicItem> items})
      : _items = items;

  factory _$_SearchTopics.fromJson(Map<String, dynamic> json) =>
      _$$_SearchTopicsFromJson(json);

  @override
  final int total_count;
  @override
  final bool incomplete_results;
  final List<TopicItem> _items;
  @override
  List<TopicItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'SearchTopics(total_count: $total_count, incomplete_results: $incomplete_results, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTopics &&
            (identical(other.total_count, total_count) ||
                other.total_count == total_count) &&
            (identical(other.incomplete_results, incomplete_results) ||
                other.incomplete_results == incomplete_results) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, total_count, incomplete_results,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchTopicsCopyWith<_$_SearchTopics> get copyWith =>
      __$$_SearchTopicsCopyWithImpl<_$_SearchTopics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchTopicsToJson(
      this,
    );
  }
}

abstract class _SearchTopics implements SearchTopics {
  factory _SearchTopics(
      {required final int total_count,
      required final bool incomplete_results,
      required final List<TopicItem> items}) = _$_SearchTopics;

  factory _SearchTopics.fromJson(Map<String, dynamic> json) =
      _$_SearchTopics.fromJson;

  @override
  int get total_count;
  @override
  bool get incomplete_results;
  @override
  List<TopicItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$_SearchTopicsCopyWith<_$_SearchTopics> get copyWith =>
      throw _privateConstructorUsedError;
}
