// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoker_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_InvokerCallbackContent _$$_InvokerCallbackContentFromJson(
        Map<String, dynamic> json) =>
    _$_InvokerCallbackContent(
      body: json['body'] as String?,
      query: json['query'] as String?,
      metadata: json['metadata'] as String?,
      method: $enumDecodeNullable(_$HttpMethodEnumMap, json['method']),
    );

Map<String, dynamic> _$$_InvokerCallbackContentToJson(
        _$_InvokerCallbackContent instance) =>
    <String, dynamic>{
      'body': instance.body,
      'query': instance.query,
      'metadata': instance.metadata,
      'method': _$HttpMethodEnumMap[instance.method],
    };

const _$HttpMethodEnumMap = {
  HttpMethod.get: 'get',
  HttpMethod.put: 'put',
  HttpMethod.post: 'post',
  HttpMethod.delete: 'delete',
};
