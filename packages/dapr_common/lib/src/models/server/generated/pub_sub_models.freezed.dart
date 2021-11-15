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
      {required String pubSubName,
      required String topicName,
      required String route}) {
    return _PubSubRoute(
      pubSubName: pubSubName,
      topicName: topicName,
      route: route,
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
  String get pubSubName => throw _privateConstructorUsedError;

  /// The name of the topic to Publish/Subscribe to.
  String get topicName => throw _privateConstructorUsedError;

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  String get route => throw _privateConstructorUsedError;

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
  $Res call({String pubSubName, String topicName, String route});
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
    Object? topicName = freezed,
    Object? route = freezed,
  }) {
    return _then(_value.copyWith(
      pubSubName: pubSubName == freezed
          ? _value.pubSubName
          : pubSubName // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: topicName == freezed
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
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
  $Res call({String pubSubName, String topicName, String route});
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
    Object? topicName = freezed,
    Object? route = freezed,
  }) {
    return _then(_PubSubRoute(
      pubSubName: pubSubName == freezed
          ? _value.pubSubName
          : pubSubName // ignore: cast_nullable_to_non_nullable
              as String,
      topicName: topicName == freezed
          ? _value.topicName
          : topicName // ignore: cast_nullable_to_non_nullable
              as String,
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PubSubRoute implements _PubSubRoute {
  const _$_PubSubRoute(
      {required this.pubSubName, required this.topicName, required this.route});

  factory _$_PubSubRoute.fromJson(Map<String, dynamic> json) =>
      _$$_PubSubRouteFromJson(json);

  @override

  /// The component name configured in a component yaml file.
  final String pubSubName;
  @override

  /// The name of the topic to Publish/Subscribe to.
  final String topicName;
  @override

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  final String route;

  @override
  String toString() {
    return 'PubSubRoute(pubSubName: $pubSubName, topicName: $topicName, route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PubSubRoute &&
            (identical(other.pubSubName, pubSubName) ||
                other.pubSubName == pubSubName) &&
            (identical(other.topicName, topicName) ||
                other.topicName == topicName) &&
            (identical(other.route, route) || other.route == route));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pubSubName, topicName, route);

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
      {required String pubSubName,
      required String topicName,
      required String route}) = _$_PubSubRoute;

  factory _PubSubRoute.fromJson(Map<String, dynamic> json) =
      _$_PubSubRoute.fromJson;

  @override

  /// The component name configured in a component yaml file.
  String get pubSubName;
  @override

  /// The name of the topic to Publish/Subscribe to.
  String get topicName;
  @override

  /// The http route name for associated with this topic.
  ///
  /// This name is primarily used for a Http server where the event from the
  /// topic will forwared to this http route built automatically.
  String get route;
  @override
  @JsonKey(ignore: true)
  _$PubSubRouteCopyWith<_PubSubRoute> get copyWith =>
      throw _privateConstructorUsedError;
}
