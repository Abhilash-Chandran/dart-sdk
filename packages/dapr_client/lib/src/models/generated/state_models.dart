import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/state_option_enums.dart';
import '../all_type_def.dart';

part 'state_models.freezed.dart';
part 'state_models.g.dart';

@freezed

/// The definition is based on the options to be passed to save state method
/// of the Dapr State api.
///
/// https://docs.dapr.io/developing-applications/building-blocks/state-management/state-management-overview/#concurrency
class SaveStateItem with _$SaveStateItem {
  factory SaveStateItem({
    required String key,
    required dynamic value,
    String? etag,
    // todo: following fields should be updated after properly understanding the api
    //
    // dynamic? metadata,
    // StateOptions options,
  }) = _SaveStateItem;

  factory SaveStateItem.fromJson(Map<String, dynamic> json) =>
      _$SaveStateItemFromJson(json);
}

@freezed
class StateOptions with _$StateOptions {
  const factory StateOptions({
    Concurrency? concurrency,
    Consistency? consistency,
  }) = _StateOptions;

  factory StateOptions.fromJson(Map<String, dynamic> json) =>
      _$StateOptionsFromJson(json);
}

@freezed
class Etag with _$Etag {
  const factory Etag({
    required String value,
  }) = _Etag;
}

@freezed
class StateOperation with _$StateOperation {
  const factory StateOperation({
    required String operation,
    required List<StateOperationRequest> request,
  }) = _StateOperation;
}

@freezed
class StateOperationRequest with _$StateOperationRequest {
  const factory StateOperationRequest({
    required String key,
    required String value,
    Etag? etag,
    StateMetaData? metaData,
    StateOptions? options,
  }) = _StateOperationRequest;
}
