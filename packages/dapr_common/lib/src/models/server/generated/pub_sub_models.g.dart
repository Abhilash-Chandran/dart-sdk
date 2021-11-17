// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_sub_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PubSubRoute _$$_PubSubRouteFromJson(Map<String, dynamic> json) =>
    _$_PubSubRoute(
      pubSubName: json['pubsubname'] as String,
      topic: json['topic'] as String,
      route: json['route'] as String,
      metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          {},
    );

Map<String, dynamic> _$$_PubSubRouteToJson(_$_PubSubRoute instance) =>
    <String, dynamic>{
      'pubsubname': instance.pubSubName,
      'topic': instance.topic,
      'route': instance.route,
      'metadata': instance.metadata,
    };
