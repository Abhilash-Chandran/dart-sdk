///
//  Generated code. Do not modify.
//  source: dapr/proto/runtime/v1/appcallback.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:async' as $async;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dart:core' as $core;
import '../../common/v1/common.pb.dart' as $0;
import '../../../../google/protobuf/empty.pb.dart' as $1;
import 'appcallback.pb.dart' as $3;
import 'appcallback.pbjson.dart';

export 'appcallback.pb.dart';

abstract class AppCallbackServiceBase extends $pb.GeneratedService {
  $async.Future<$0.InvokeResponse> onInvoke($pb.ServerContext ctx, $0.InvokeRequest request);
  $async.Future<$3.ListTopicSubscriptionsResponse> listTopicSubscriptions($pb.ServerContext ctx, $1.Empty request);
  $async.Future<$3.TopicEventResponse> onTopicEvent($pb.ServerContext ctx, $3.TopicEventRequest request);
  $async.Future<$3.ListInputBindingsResponse> listInputBindings($pb.ServerContext ctx, $1.Empty request);
  $async.Future<$3.BindingEventResponse> onBindingEvent($pb.ServerContext ctx, $3.BindingEventRequest request);

  $pb.GeneratedMessage createRequest($core.String method) {
    switch (method) {
      case 'OnInvoke': return $0.InvokeRequest();
      case 'ListTopicSubscriptions': return $1.Empty();
      case 'OnTopicEvent': return $3.TopicEventRequest();
      case 'ListInputBindings': return $1.Empty();
      case 'OnBindingEvent': return $3.BindingEventRequest();
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String method, $pb.GeneratedMessage request) {
    switch (method) {
      case 'OnInvoke': return this.onInvoke(ctx, request as $0.InvokeRequest);
      case 'ListTopicSubscriptions': return this.listTopicSubscriptions(ctx, request as $1.Empty);
      case 'OnTopicEvent': return this.onTopicEvent(ctx, request as $3.TopicEventRequest);
      case 'ListInputBindings': return this.listInputBindings(ctx, request as $1.Empty);
      case 'OnBindingEvent': return this.onBindingEvent(ctx, request as $3.BindingEventRequest);
      default: throw $core.ArgumentError('Unknown method: $method');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AppCallbackServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AppCallbackServiceBase$messageJson;
}

