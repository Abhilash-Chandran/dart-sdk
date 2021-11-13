// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'invoker_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InvokerCallbackContent _$InvokerCallbackContentFromJson(
    Map<String, dynamic> json) {
  return _InvokerCallbackContent.fromJson(json);
}

/// @nodoc
class _$InvokerCallbackContentTearOff {
  const _$InvokerCallbackContentTearOff();

  _InvokerCallbackContent call(
      {String? body, String? query, String? metadata, HttpMethod? method}) {
    return _InvokerCallbackContent(
      body: body,
      query: query,
      metadata: metadata,
      method: method,
    );
  }

  InvokerCallbackContent fromJson(Map<String, Object?> json) {
    return InvokerCallbackContent.fromJson(json);
  }
}

/// @nodoc
const $InvokerCallbackContent = _$InvokerCallbackContentTearOff();

/// @nodoc
mixin _$InvokerCallbackContent {
  String? get body => throw _privateConstructorUsedError;
  String? get query => throw _privateConstructorUsedError;
  String? get metadata => throw _privateConstructorUsedError;
  HttpMethod? get method => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvokerCallbackContentCopyWith<InvokerCallbackContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvokerCallbackContentCopyWith<$Res> {
  factory $InvokerCallbackContentCopyWith(InvokerCallbackContent value,
          $Res Function(InvokerCallbackContent) then) =
      _$InvokerCallbackContentCopyWithImpl<$Res>;
  $Res call(
      {String? body, String? query, String? metadata, HttpMethod? method});
}

/// @nodoc
class _$InvokerCallbackContentCopyWithImpl<$Res>
    implements $InvokerCallbackContentCopyWith<$Res> {
  _$InvokerCallbackContentCopyWithImpl(this._value, this._then);

  final InvokerCallbackContent _value;
  // ignore: unused_field
  final $Res Function(InvokerCallbackContent) _then;

  @override
  $Res call({
    Object? body = freezed,
    Object? query = freezed,
    Object? metadata = freezed,
    Object? method = freezed,
  }) {
    return _then(_value.copyWith(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String?,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod?,
    ));
  }
}

/// @nodoc
abstract class _$InvokerCallbackContentCopyWith<$Res>
    implements $InvokerCallbackContentCopyWith<$Res> {
  factory _$InvokerCallbackContentCopyWith(_InvokerCallbackContent value,
          $Res Function(_InvokerCallbackContent) then) =
      __$InvokerCallbackContentCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? body, String? query, String? metadata, HttpMethod? method});
}

/// @nodoc
class __$InvokerCallbackContentCopyWithImpl<$Res>
    extends _$InvokerCallbackContentCopyWithImpl<$Res>
    implements _$InvokerCallbackContentCopyWith<$Res> {
  __$InvokerCallbackContentCopyWithImpl(_InvokerCallbackContent _value,
      $Res Function(_InvokerCallbackContent) _then)
      : super(_value, (v) => _then(v as _InvokerCallbackContent));

  @override
  _InvokerCallbackContent get _value => super._value as _InvokerCallbackContent;

  @override
  $Res call({
    Object? body = freezed,
    Object? query = freezed,
    Object? metadata = freezed,
    Object? method = freezed,
  }) {
    return _then(_InvokerCallbackContent(
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      query: query == freezed
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as String?,
      method: method == freezed
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as HttpMethod?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InvokerCallbackContent implements _InvokerCallbackContent {
  const _$_InvokerCallbackContent(
      {this.body, this.query, this.metadata, this.method});

  factory _$_InvokerCallbackContent.fromJson(Map<String, dynamic> json) =>
      _$$_InvokerCallbackContentFromJson(json);

  @override
  final String? body;
  @override
  final String? query;
  @override
  final String? metadata;
  @override
  final HttpMethod? method;

  @override
  String toString() {
    return 'InvokerCallbackContent(body: $body, query: $query, metadata: $metadata, method: $method)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InvokerCallbackContent &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.query, query) || other.query == query) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, body, query, metadata, method);

  @JsonKey(ignore: true)
  @override
  _$InvokerCallbackContentCopyWith<_InvokerCallbackContent> get copyWith =>
      __$InvokerCallbackContentCopyWithImpl<_InvokerCallbackContent>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InvokerCallbackContentToJson(this);
  }
}

abstract class _InvokerCallbackContent implements InvokerCallbackContent {
  const factory _InvokerCallbackContent(
      {String? body,
      String? query,
      String? metadata,
      HttpMethod? method}) = _$_InvokerCallbackContent;

  factory _InvokerCallbackContent.fromJson(Map<String, dynamic> json) =
      _$_InvokerCallbackContent.fromJson;

  @override
  String? get body;
  @override
  String? get query;
  @override
  String? get metadata;
  @override
  HttpMethod? get method;
  @override
  @JsonKey(ignore: true)
  _$InvokerCallbackContentCopyWith<_InvokerCallbackContent> get copyWith =>
      throw _privateConstructorUsedError;
}
