// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_topics_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SearchTopicsRequest _$SearchTopicsRequestFromJson(Map<String, dynamic> json) {
  return _SearchTopicsRequest.fromJson(json);
}

/// @nodoc
mixin _$SearchTopicsRequest {
  ///keyWord
  String get q => throw _privateConstructorUsedError;
  int? get per_page => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchTopicsRequestCopyWith<SearchTopicsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchTopicsRequestCopyWith<$Res> {
  factory $SearchTopicsRequestCopyWith(
          SearchTopicsRequest value, $Res Function(SearchTopicsRequest) then) =
      _$SearchTopicsRequestCopyWithImpl<$Res, SearchTopicsRequest>;
  @useResult
  $Res call({String q, int? per_page, int? page});
}

/// @nodoc
class _$SearchTopicsRequestCopyWithImpl<$Res, $Val extends SearchTopicsRequest>
    implements $SearchTopicsRequestCopyWith<$Res> {
  _$SearchTopicsRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? per_page = freezed,
    Object? page = freezed,
  }) {
    return _then(_value.copyWith(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SearchTopicsRequestCopyWith<$Res>
    implements $SearchTopicsRequestCopyWith<$Res> {
  factory _$$_SearchTopicsRequestCopyWith(_$_SearchTopicsRequest value,
          $Res Function(_$_SearchTopicsRequest) then) =
      __$$_SearchTopicsRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String q, int? per_page, int? page});
}

/// @nodoc
class __$$_SearchTopicsRequestCopyWithImpl<$Res>
    extends _$SearchTopicsRequestCopyWithImpl<$Res, _$_SearchTopicsRequest>
    implements _$$_SearchTopicsRequestCopyWith<$Res> {
  __$$_SearchTopicsRequestCopyWithImpl(_$_SearchTopicsRequest _value,
      $Res Function(_$_SearchTopicsRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? q = null,
    Object? per_page = freezed,
    Object? page = freezed,
  }) {
    return _then(_$_SearchTopicsRequest(
      q: null == q
          ? _value.q
          : q // ignore: cast_nullable_to_non_nullable
              as String,
      per_page: freezed == per_page
          ? _value.per_page
          : per_page // ignore: cast_nullable_to_non_nullable
              as int?,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SearchTopicsRequest implements _SearchTopicsRequest {
  _$_SearchTopicsRequest({required this.q, this.per_page, this.page});

  factory _$_SearchTopicsRequest.fromJson(Map<String, dynamic> json) =>
      _$$_SearchTopicsRequestFromJson(json);

  ///keyWord
  @override
  final String q;
  @override
  final int? per_page;
  @override
  final int? page;

  @override
  String toString() {
    return 'SearchTopicsRequest(q: $q, per_page: $per_page, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchTopicsRequest &&
            (identical(other.q, q) || other.q == q) &&
            (identical(other.per_page, per_page) ||
                other.per_page == per_page) &&
            (identical(other.page, page) || other.page == page));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, q, per_page, page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SearchTopicsRequestCopyWith<_$_SearchTopicsRequest> get copyWith =>
      __$$_SearchTopicsRequestCopyWithImpl<_$_SearchTopicsRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SearchTopicsRequestToJson(
      this,
    );
  }
}

abstract class _SearchTopicsRequest implements SearchTopicsRequest {
  factory _SearchTopicsRequest(
      {required final String q,
      final int? per_page,
      final int? page}) = _$_SearchTopicsRequest;

  factory _SearchTopicsRequest.fromJson(Map<String, dynamic> json) =
      _$_SearchTopicsRequest.fromJson;

  @override

  ///keyWord
  String get q;
  @override
  int? get per_page;
  @override
  int? get page;
  @override
  @JsonKey(ignore: true)
  _$$_SearchTopicsRequestCopyWith<_$_SearchTopicsRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
