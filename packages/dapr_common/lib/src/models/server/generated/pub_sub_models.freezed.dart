// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'pub_sub_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PubSubRoute _$PubSubRouteFromJson(Map<String, dynamic> json) {
  return _PubSubRoute.fromJson(json);
}

/// @nodoc
class _$PubSubRouteTearOff {
  const _$PubSubRouteTearOff();

  _PubSubRoute call(
      {@JsonKey(name: 'pubsubname') required String pubSubName,
      required String topic,
      required String route,
      Map<String, String> metadata = const {}}) {
    return _PubSubRoute(
      pubSubName: pubSubName,
      topic: topic,
      route: route,
      metadata: metadata,
    );
  }

  PubSubRoute fromJson(Map<String, Object?> json) {
    return PubSubRoute.fromJson(json);
  }
}

/// @nodoc
const $PubSubRoute = _$PubSubRouteTearOff();

/// @nodoc
mixin _$PubSubRoute {
  /// The component name configured in a component yaml file.
  @JsonKey(name: 'pubsubname')
  String get pubSubName => throw _privateConstructorUsedError;

  /// The name of the topic to Publish/Subscribe to.
  String get topic => throw _privateConstructorUsedError;

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  String get route => throw _privateConstructorUsedError;

  /// Metadata to be passed to the dapr. e.g. rawPayload.
  /// https://docs.dapr.io/developing-applications/building-blocks/pubsub/pubsub-raw/
  Map<String, String> get metadata => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PubSubRouteCopyWith<PubSubRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubSubRouteCopyWith<$Res> {
  factory $PubSubRouteCopyWith(
          PubSubRoute value, $Res Function(PubSubRoute) then) =
      _$PubSubRouteCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'pubsubname') String pubSubName,
      String topic,
      String route,
      Map<String, String> metadata});
}

/// @nodoc
class _$PubSubRouteCopyWithImpl<$Res> implements $PubSubRouteCopyWith<$Res> {
  _$PubSubRouteCopyWithImpl(this._value, this._then);

  final PubSubRoute _value;
  // ignore: unused_field
  final $Res Function(PubSubRoute) _then;

  @override
  $Res call({
    Object? pubSubName = freezed,
    Object? topic = freezed,
    Object? route = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_value.copyWith(
      pubSubName: pubSubName == freezed
          ? _value.pubSubName
          : pubSubName // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$PubSubRouteCopyWith<$Res>
    implements $PubSubRouteCopyWith<$Res> {
  factory _$PubSubRouteCopyWith(
          _PubSubRoute value, $Res Function(_PubSubRoute) then) =
      __$PubSubRouteCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'pubsubname') String pubSubName,
      String topic,
      String route,
      Map<String, String> metadata});
}

/// @nodoc
class __$PubSubRouteCopyWithImpl<$Res> extends _$PubSubRouteCopyWithImpl<$Res>
    implements _$PubSubRouteCopyWith<$Res> {
  __$PubSubRouteCopyWithImpl(
      _PubSubRoute _value, $Res Function(_PubSubRoute) _then)
      : super(_value, (v) => _then(v as _PubSubRoute));

  @override
  _PubSubRoute get _value => super._value as _PubSubRoute;

  @override
  $Res call({
    Object? pubSubName = freezed,
    Object? topic = freezed,
    Object? route = freezed,
    Object? metadata = freezed,
  }) {
    return _then(_PubSubRoute(
      pubSubName: pubSubName == freezed
          ? _value.pubSubName
          : pubSubName // ignore: cast_nullable_to_non_nullable
              as String,
      topic: topic == freezed
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: metadata == freezed
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PubSubRoute implements _PubSubRoute {
  const _$_PubSubRoute(
      {@JsonKey(name: 'pubsubname') required this.pubSubName,
      required this.topic,
      required this.route,
      this.metadata = const {}});

  factory _$_PubSubRoute.fromJson(Map<String, dynamic> json) =>
      _$$_PubSubRouteFromJson(json);

  @override

  /// The component name configured in a component yaml file.
  @JsonKey(name: 'pubsubname')
  final String pubSubName;
  @override

  /// The name of the topic to Publish/Subscribe to.
  final String topic;
  @override

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  final String route;
  @JsonKey(defaultValue: const {})
  @override

  /// Metadata to be passed to the dapr. e.g. rawPayload.
  /// https://docs.dapr.io/developing-applications/building-blocks/pubsub/pubsub-raw/
  final Map<String, String> metadata;

  @override
  String toString() {
    return 'PubSubRoute(pubSubName: $pubSubName, topic: $topic, route: $route, metadata: $metadata)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PubSubRoute &&
            (identical(other.pubSubName, pubSubName) ||
                other.pubSubName == pubSubName) &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.route, route) || other.route == route) &&
            const DeepCollectionEquality().equals(other.metadata, metadata));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pubSubName, topic, route,
      const DeepCollectionEquality().hash(metadata));

  @JsonKey(ignore: true)
  @override
  _$PubSubRouteCopyWith<_PubSubRoute> get copyWith =>
      __$PubSubRouteCopyWithImpl<_PubSubRoute>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PubSubRouteToJson(this);
  }
}

abstract class _PubSubRoute implements PubSubRoute {
  const factory _PubSubRoute(
      {@JsonKey(name: 'pubsubname') required String pubSubName,
      required String topic,
      required String route,
      Map<String, String> metadata}) = _$_PubSubRoute;

  factory _PubSubRoute.fromJson(Map<String, dynamic> json) =
      _$_PubSubRoute.fromJson;

  @override

  /// The component name configured in a component yaml file.
  @JsonKey(name: 'pubsubname')
  String get pubSubName;
  @override

  /// The name of the topic to Publish/Subscribe to.
  String get topic;
  @override

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  String get route;
  @override

  /// Metadata to be passed to the dapr. e.g. rawPayload.
  /// https://docs.dapr.io/developing-applications/building-blocks/pubsub/pubsub-raw/
  Map<String, String> get metadata;
  @override
  @JsonKey(ignore: true)
  _$PubSubRouteCopyWith<_PubSubRoute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$PubSubResponseTearOff {
  const _$PubSubResponseTearOff();

  Success success() {
    return const Success();
  }

  Drop drop() {
    return const Drop();
  }

  Retry retry() {
    return const Retry();
  }

  Error error() {
    return const Error();
  }
}

/// @nodoc
const $PubSubResponse = _$PubSubResponseTearOff();

/// @nodoc
mixin _$PubSubResponse {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() drop,
    required TResult Function() retry,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Drop value) drop,
    required TResult Function(Retry value) retry,
    required TResult Function(Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PubSubResponseCopyWith<$Res> {
  factory $PubSubResponseCopyWith(
          PubSubResponse value, $Res Function(PubSubResponse) then) =
      _$PubSubResponseCopyWithImpl<$Res>;
}

/// @nodoc
class _$PubSubResponseCopyWithImpl<$Res>
    implements $PubSubResponseCopyWith<$Res> {
  _$PubSubResponseCopyWithImpl(this._value, this._then);

  final PubSubResponse _value;
  // ignore: unused_field
  final $Res Function(PubSubResponse) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$PubSubResponseCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc

class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'PubSubResponse.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() drop,
    required TResult Function() retry,
    required TResult Function() error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Drop value) drop,
    required TResult Function(Retry value) retry,
    required TResult Function(Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements PubSubResponse {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $DropCopyWith<$Res> {
  factory $DropCopyWith(Drop value, $Res Function(Drop) then) =
      _$DropCopyWithImpl<$Res>;
}

/// @nodoc
class _$DropCopyWithImpl<$Res> extends _$PubSubResponseCopyWithImpl<$Res>
    implements $DropCopyWith<$Res> {
  _$DropCopyWithImpl(Drop _value, $Res Function(Drop) _then)
      : super(_value, (v) => _then(v as Drop));

  @override
  Drop get _value => super._value as Drop;
}

/// @nodoc

class _$Drop implements Drop {
  const _$Drop();

  @override
  String toString() {
    return 'PubSubResponse.drop()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Drop);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() drop,
    required TResult Function() retry,
    required TResult Function() error,
  }) {
    return drop();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
  }) {
    return drop?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (drop != null) {
      return drop();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Drop value) drop,
    required TResult Function(Retry value) retry,
    required TResult Function(Error value) error,
  }) {
    return drop(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
  }) {
    return drop?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (drop != null) {
      return drop(this);
    }
    return orElse();
  }
}

abstract class Drop implements PubSubResponse {
  const factory Drop() = _$Drop;
}

/// @nodoc
abstract class $RetryCopyWith<$Res> {
  factory $RetryCopyWith(Retry value, $Res Function(Retry) then) =
      _$RetryCopyWithImpl<$Res>;
}

/// @nodoc
class _$RetryCopyWithImpl<$Res> extends _$PubSubResponseCopyWithImpl<$Res>
    implements $RetryCopyWith<$Res> {
  _$RetryCopyWithImpl(Retry _value, $Res Function(Retry) _then)
      : super(_value, (v) => _then(v as Retry));

  @override
  Retry get _value => super._value as Retry;
}

/// @nodoc

class _$Retry implements Retry {
  const _$Retry();

  @override
  String toString() {
    return 'PubSubResponse.retry()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Retry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() drop,
    required TResult Function() retry,
    required TResult Function() error,
  }) {
    return retry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
  }) {
    return retry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Drop value) drop,
    required TResult Function(Retry value) retry,
    required TResult Function(Error value) error,
  }) {
    return retry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
  }) {
    return retry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry(this);
    }
    return orElse();
  }
}

abstract class Retry implements PubSubResponse {
  const factory Retry() = _$Retry;
}

/// @nodoc
abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> extends _$PubSubResponseCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;
}

/// @nodoc

class _$Error implements Error {
  const _$Error();

  @override
  String toString() {
    return 'PubSubResponse.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() drop,
    required TResult Function() retry,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? drop,
    TResult Function()? retry,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Drop value) drop,
    required TResult Function(Retry value) retry,
    required TResult Function(Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Drop value)? drop,
    TResult Function(Retry value)? retry,
    TResult Function(Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements PubSubResponse {
  const factory Error() = _$Error;
}
