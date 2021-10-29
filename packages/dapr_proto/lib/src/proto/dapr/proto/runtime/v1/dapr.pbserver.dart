///
//  Generated code. Do not modify.
//  source: dapr/proto/runtime/v1/dapr.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import 'dapr.pb.dart' as $3;
import '../../common/v1/common.pb.dart' as $0;
import '../../../../google/protobuf/empty.pb.dart' as $2;
import 'dapr.pbjson.dart';

export 'dapr.pb.dart';

abstract class DaprServiceBase extends $pb.GeneratedService {
  $async.Future<$0.InvokeResponse> invokeService($pb.ServerContext ctx, $3.InvokeServiceRequest request);
  $async.Future<$3.GetStateResponse> getState($pb.ServerContext ctx, $3.GetStateRequest request);
  $async.Future<$3.GetBulkStateResponse> getBulkState($pb.ServerContext ctx, $3.GetBulkStateRequest request);
  $async.Future<$2.Empty> saveState($pb.ServerContext ctx, $3.SaveStateRequest request);
  $async.Future<$2.Empty> deleteState($pb.ServerContext ctx, $3.DeleteStateRequest request);
  $async.Future<$2.Empty> deleteBulkState($pb.ServerContext ctx, $3.DeleteBulkStateRequest request);
  $async.Future<$2.Empty> executeStateTransaction($pb.ServerContext ctx, $3.ExecuteStateTransactionRequest request);
  $async.Future<$2.Empty> publishEvent($pb.ServerContext ctx, $3.PublishEventRequest request);
  $async.Future<$3.InvokeBindingResponse> invokeBinding($pb.ServerContext ctx, $3.InvokeBindingRequest request);
  $async.Future<$3.GetSecretResponse> getSecret($pb.ServerContext ctx, $3.GetSecretRequest request);
  $async.Future<$3.GetBulkSecretResponse> getBulkSecret($pb.ServerContext ctx, $3.GetBulkSecretRequest request);
  $async.Future<$2.Empty> registerActorTimer($pb.ServerContext ctx, $3.RegisterActorTimerRequest request);
  $async.Future<$2.Empty> unregisterActorTimer($pb.ServerContext ctx, $3.UnregisterActorTimerRequest request);
  $async.Future<$2.Empty> registerActorReminder($pb.ServerContext ctx, $3.RegisterActorReminderRequest request);
  $async.Future<$2.Empty> unregisterActorReminder($pb.ServerContext ctx, $3.UnregisterActorReminderRequest request);
  $async.Future<$3.GetActorStateResponse> getActorState($pb.ServerContext ctx, $3.GetActorStateRequest request);
  $async.Future<$2.Empty> executeActorStateTransaction($pb.ServerContext ctx, $3.ExecuteActorStateTransactionRequest request);
  $async.Future<$3.InvokeActorResponse> invokeActor($pb.ServerContext ctx, $3.InvokeActorRequest request);
  $async.Future<$3.GetMetadataResponse> getMetadata($pb.ServerContext ctx, $2.Empty request);
  $async.Future<$2.Empty> setMetadata($pb.ServerContext ctx, $3.SetMetadataRequest request);
  $async.Future<$2.Empty> shutdown($pb.ServerContext ctx, $2.Empty request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'InvokeService': return $3.InvokeServiceRequest();
      case 'GetState': return $3.GetStateRequest();
      case 'GetBulkState': return $3.GetBulkStateRequest();
      case 'SaveState': return $3.SaveStateRequest();
      case 'DeleteState': return $3.DeleteStateRequest();
      case 'DeleteBulkState': return $3.DeleteBulkStateRequest();
      case 'ExecuteStateTransaction': return $3.ExecuteStateTransactionRequest();
      case 'PublishEvent': return $3.PublishEventRequest();
      case 'InvokeBinding': return $3.InvokeBindingRequest();
      case 'GetSecret': return $3.GetSecretRequest();
      case 'GetBulkSecret': return $3.GetBulkSecretRequest();
      case 'RegisterActorTimer': return $3.RegisterActorTimerRequest();
      case 'UnregisterActorTimer': return $3.UnregisterActorTimerRequest();
      case 'RegisterActorReminder': return $3.RegisterActorReminderRequest();
      case 'UnregisterActorReminder': return $3.UnregisterActorReminderRequest();
      case 'GetActorState': return $3.GetActorStateRequest();
      case 'ExecuteActorStateTransaction': return $3.ExecuteActorStateTransactionRequest();
      case 'InvokeActor': return $3.InvokeActorRequest();
      case 'GetMetadata': return $2.Empty();
      case 'SetMetadata': return $3.SetMetadataRequest();
      case 'Shutdown': return $2.Empty();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'InvokeService': return this.invokeService(ctx, request as $3.InvokeServiceRequest);
      case 'GetState': return this.getState(ctx, request as $3.GetStateRequest);
      case 'GetBulkState': return this.getBulkState(ctx, request as $3.GetBulkStateRequest);
      case 'SaveState': return this.saveState(ctx, request as $3.SaveStateRequest);
      case 'DeleteState': return this.deleteState(ctx, request as $3.DeleteStateRequest);
      case 'DeleteBulkState': return this.deleteBulkState(ctx, request as $3.DeleteBulkStateRequest);
      case 'ExecuteStateTransaction': return this.executeStateTransaction(ctx, request as $3.ExecuteStateTransactionRequest);
      case 'PublishEvent': return this.publishEvent(ctx, request as $3.PublishEventRequest);
      case 'InvokeBinding': return this.invokeBinding(ctx, request as $3.InvokeBindingRequest);
      case 'GetSecret': return this.getSecret(ctx, request as $3.GetSecretRequest);
      case 'GetBulkSecret': return this.getBulkSecret(ctx, request as $3.GetBulkSecretRequest);
      case 'RegisterActorTimer': return this.registerActorTimer(ctx, request as $3.RegisterActorTimerRequest);
      case 'UnregisterActorTimer': return this.unregisterActorTimer(ctx, request as $3.UnregisterActorTimerRequest);
      case 'RegisterActorReminder': return this.registerActorReminder(ctx, request as $3.RegisterActorReminderRequest);
      case 'UnregisterActorReminder': return this.unregisterActorReminder(ctx, request as $3.UnregisterActorReminderRequest);
      case 'GetActorState': return this.getActorState(ctx, request as $3.GetActorStateRequest);
      case 'ExecuteActorStateTransaction': return this.executeActorStateTransaction(ctx, request as $3.ExecuteActorStateTransactionRequest);
      case 'InvokeActor': return this.invokeActor(ctx, request as $3.InvokeActorRequest);
      case 'GetMetadata': return this.getMetadata(ctx, request as $2.Empty);
      case 'SetMetadata': return this.setMetadata(ctx, request as $3.SetMetadataRequest);
      case 'Shutdown': return this.shutdown(ctx, request as $2.Empty);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DaprServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DaprServiceBase$messageJson;
}

