// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub_sub_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PubSubRoute _$$_PubSubRouteFromJson(Map<String, dynamic> json) =>
    _$_PubSubRoute(
      pubSubName: json['pubSubName'] as String,
      topicName: json['topicName'] as String,
      route: json['route'] as String,
    );

Map<String, dynamic> _$$_PubSubRouteToJson(_$_PubSubRoute instance) =>
    <String, dynamic>{
      'pubSubName': instance.pubSubName,
      'topicName': instance.topicName,
      'route': instance.route,
    };
