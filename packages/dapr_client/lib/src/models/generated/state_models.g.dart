// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SaveStateItem _$$_SaveStateItemFromJson(Map<String, dynamic> json) =>
    _$_SaveStateItem(
      key: json['key'] as String,
      value: json['value'],
      etag: json['etag'] as String?,
    );

Map<String, dynamic> _$$_SaveStateItemToJson(_$_SaveStateItem instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
      'etag': instance.etag,
    };

_$_StateOptions _$$_StateOptionsFromJson(Map<String, dynamic> json) =>
    _$_StateOptions(
      concurrency:
          $enumDecodeNullable(_$ConcurrencyEnumMap, json['concurrency']),
      consistency:
          $enumDecodeNullable(_$ConsistencyEnumMap, json['consistency']),
    );

Map<String, dynamic> _$$_StateOptionsToJson(_$_StateOptions instance) =>
    <String, dynamic>{
      'concurrency': _$ConcurrencyEnumMap[instance.concurrency],
      'consistency': _$ConsistencyEnumMap[instance.consistency],
    };

const _$ConcurrencyEnumMap = {
  Concurrency.unspecified: 'unspecified',
  Concurrency.firstWrite: 'firstWrite',
  Concurrency.lastWrite: 'lastWrite',
};

const _$ConsistencyEnumMap = {
  Consistency.unspecified: 'unspecified',
  Consistency.eventual: 'eventual',
  Consistency.strong: 'strong',
};
